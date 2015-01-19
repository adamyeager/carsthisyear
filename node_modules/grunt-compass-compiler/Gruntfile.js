/*
 *	grunt-compass-compiler
 *	https://github.com/mattacular/grunt-compass-compiler
 *
 *	Copyright (c) 2013 mstills
 *	Licensed under the MIT license.
 */
module.exports = function (grunt) {
	'use strict';

	grunt.initConfig({
		// scripts to be linted
		jshint: {
			all: [
				'Gruntfile.js',
				'tasks/compass.js'
			]
		},
		// tasks used to test this task
		compass: {
			glob: {
				options: {
					css_dir: 'tmp',
					sass_dir: 'sass',
					output_style: 'compressed',
					c: 'prod.rb'
				},
				files: {
					src: ['tests/modules/test-all-options']
				}
			},
			glob_no_options: {
				options: {
					css_dir: 'tmp'
				},
				files: {
					src: ['tests/modules/test-no-options']
				}
			},
			many: {
				options: {
					css_dir: 'tmp'
				},
				files: {
					src: ['tests/modules/test-many']
				}
			},
			clean: {
				options: {
					css_dir: 'expected',
					sass_dir: 'sass',
					output_style: 'compressed',
					c: 'prod.rb'
				},
				files: {
					src: ['tests/modules/test-all-options']
				}
			},
			clean_no_opts: {
				files: {
					src: ['tests/modules/test-no-options']
				}
			},
			clean_many: {
				files: {
					src: ['tests/modules/test-many']
				}
			}
		},
		clean: {
			css: {
				src: ['tests/modules/**/tmp/*.css']
			},
			expected: {
				src: ['tests/modules/**/expected/*.css']
			}
		},
		// test suite
		nodeunit: {
			tests: ['tests/**/*_test.js']
		}
	});

	grunt.loadTasks('tasks');

	grunt.loadNpmTasks('grunt-contrib-jshint');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-nodeunit');

	// lint and test before declaring a revision stable.
	grunt.registerTask('default', ['jshint']);
	grunt.registerTask('build-tests', ['clean:expected', 'compass:clean_many', 'compass:clean_no_opts', 'compass:clean']);
	grunt.registerTask('test', ['jshint', 'clean:css', 'compass:glob', 'compass:glob_no_options', 'compass:many', 'nodeunit']);
};