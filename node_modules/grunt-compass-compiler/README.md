# grunt-compass-compiler

A [Grunt](http://gruntjs.com) plugin for compiling multiple Compass projects (ie. it compiles against many config.rb targets). This is useful for highly modular project structures such as those of Drupal and Wordpress.

## Getting Started

**IMPORTANT**: This plugin requires at least ***Grunt 0.4*** or higher and ***Compass 0.12.2*** or higher - it is recommended that you always run the latest versions of both.

Ensure you have Compass installed and in your PATH by checking for its version. If you get an error, install it.

```bash
$ compass --version   # you should see version 0.12.2 or higher
$ gem install compass # if you get an error
```

Now install the Grunt task:

```bash
$ npm install grunt-compass-compiler
```

Then add this line to your project's `Gruntfile.js`:

```js
grunt.loadNpmTasks('grunt-compass-compiler');
```

This allows you to use the 'compass' task to specify targets!

```js
	compass: {
		modules: {
			options: {
				css_dir: 'css',
				sass_dir: 'sass',
				javascripts_dir: 'js',
				output_style: (grunt.option('env') === 'prod') ? 'compressed' : 'expanded',
				c: 'prod.rb'	// look for something other than config.rb and use it to compile
				ignore_pattern: /sass|css|js|img|images|inc|includes/,	// paths you know won't contain a compass config
			},
			files: {
				src: ['sites/all/modules/**/*']
			}
		}
	}
```

The task will look for a 'prod.rb' (instead of config.rb) file in each target directory found. It will execute 'compass compile' along with any given option on each target.

```bash
$ grunt compass:modules --env=prod
```

Would compile each prod.rb found anywhere inside "sites/all/modules" by executing this command:

```bash
$ compass compile -c prod.rb --sass-dir=sass --javascripts-dir=js --css-dir=css --output-style=compressed
```

## Documentation

* The `compass` task is a [multi task](https://github.com/gruntjs/grunt/blob/master/docs/types_of_tasks.md#multi-tasks), meaning that it will implicitly iterate over all of its targets if no target is specified.

* Windows support is predictably absent

* You must have Compass in your system PATH or this task won't work

## Contributing

Feel free to fork if you see possible improvements or contact me directly if you want to contribute to this project (or just submit a pull request): mattacular@gmail.com

## Author

* [Matt Stills](http://www.mattstills.com)
  [![@mattacular on Twitter](https://secure.gravatar.com/avatar/fc34dc6cf17121952e967cdba43f76fe?s=70)](http://twitter.com/mattacular "Follow @mattacular on Twitter")

## License

This project is licensed under the [MIT](http://mths.be/mit) license.

