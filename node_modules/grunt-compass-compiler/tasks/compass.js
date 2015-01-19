/*
 *	grunt-compass-compiler
 *	https://github.com/mattacular/grunt-compass-compiler
 *
 *	Copyright (c) 2013 mstills
 *	Licensed under the MIT license.
 */
module.exports = function (grunt) {
	'use strict';

	var _ = grunt.util._,
		fs = require('fs'),
		f = require('util').format,
		cp = require('child_process'),
		queue = require('async').queue,
		log = grunt.log,
		transformOptions;

	// helper
	transformOptions = function (opts) {
		var retVal = '',
			value, option;

		for (option in opts) {
			value = opts[option];

			if (value) {
				retVal += (option !== 'c' ? ' --' : ' -') + option.replace('_', '-') + ((typeof value === 'string') ? (option !== 'c' ? '=' : ' ') + value : '');
			}
		}

		return (retVal === '') ? '' : retVal + ' --force'; // force option is needed if we are overriding config.rb options via CLI
	};

	// the 'compass' task
	grunt.registerMultiTask('compass', 'Compile multiple Compass projects.', function () {
		var options = this.options({
				output_style: false,
				sass_dir: false,
				css_dir: false,
				javascripts_dir: false,
				ignore_pattern: /sass|css|js|img|inc[(?:ludes)]|template[s]?/,
				c: false
			}),
			compilerOptions = false,
			targets = [],
			done = this.async(),
			configFile = options.c || 'config.rb',
			files, childProcess, targetQueue;

		// gather a list of targets with a 'config.rb' from all the file matches found by Grunt's globbing engine
		this.files.forEach(function (f) {
			for (var i = 0; i < f.src.length; i += 1) {
				// filter out folders that don't have a config.rb (ignoring common sub-folders to speed things up)
				if (!f.src[i].match(options.ignore_pattern) && grunt.file.isDir(f.src[i])) {
					files = fs.readdirSync(f.src[i]);
					
					if (_.indexOf(files, configFile) !== -1) {
						// contains config.rb, add it to the list of compile targets
						targets.push(f.src[i]);
					}
				}
			}
		});

		// transform task options into arguments compatible with the Compass CLI utility
		delete options.ignore_pattern;
		compilerOptions = transformOptions(options);

		// begin
		grunt.log.writeln('Compass projects found: ', f(targets));
		grunt.log.writeln();

		if (compilerOptions) {
			grunt.log.writeln('Compiling w/options: ' + compilerOptions + '...');
		} else {
			grunt.log.writeln('Compiling...\n');
		}

		// use an async queue with concurrency of 1 to perform procedural execution of the 'compass compile' command in each target cwd
		targetQueue = queue(function (task, callback) {
			childProcess = cp.exec('compass compile' + compilerOptions, { cwd: task.directory }); // @TODO allow compile-time options
			childProcess.stdout.on('data', function (d) { log.write(d); });

			// listen for process exit code
			childProcess.on('exit', function (code) {
				if (code !== 0) {
					log.error('Something bad happened. Make sure \'compass\' and \'sass\' are in your path!');
					return done(false);
				}
				log.writeln('\t`-->'.cyan + ' Done compiling Compass project @ ' + task.directory.cyan);
				callback(); // task is finished
			});
		}, 4);

		// queue each target
		_.each(targets, function (item, idx) {
			targetQueue.push({
				'directory': item
			});
		});

		// drain callback is run once all tasks in the queue have completed
		targetQueue.drain = function () {
			done();	// signal back to Grunt that this task has completed
		};

	});

};