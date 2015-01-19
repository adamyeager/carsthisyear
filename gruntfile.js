module.exports = function(grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		//image concatination
		imagemin: {
		    dynamic: {
		        files: [{
		            expand: true,
		            cwd: 'images/',
		            src: ['**/*.{png,jpg,gif}'],
		            dest: 'images/compressed/'
		        }]
		    }
		},
		//sass compiling
		sass: {
			dist: {
				options: {
					style:'compressed'
				},
				files: {
					'css/main.css': 'scss/main.scss'
			}	}
		},
		//watching task that runs while grunt is running
		watch: {
			//watch rules for sass compiling
			css: {
				files: ['scss/*.scss'],
			    tasks: ['sass'],
			    options: {
			        spawn: false,
			    }
			}
		}
	});
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-imagemin');
	grunt.registerTask('default',['watch', 'imagemin']);
}