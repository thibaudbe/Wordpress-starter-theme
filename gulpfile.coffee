# require('coffee-script');
# require('gulpfile.coffee');

gulp 		= require 'gulp'
plugins 	= require('gulp-load-plugins')()
concatCSS 	= require 'gulp-concat-css'
minifyCSS 	= require 'gulp-minify-css'
bowerFiles  = require 'gulp-bower-files'

# Root
dir =
	bower:	'bower_components'
	coffee:	'assets/src/coffee'
	lib:	'assets/src/lib'
	scss:	'assets/src/scss'
	img:	'assets/build/img'
	css:	'assets/build/css'
	js:		'assets/build/js'
	twig:	'views'
	php: 	''


# - Styles -
# ----------
gulp.task 'sass', ->
	gulp.src(dir.scss + '/*.scss')
		# .pipe plugins.changed(dir.scss)
		.pipe plugins.plumber()
		.pipe plugins.watch()
		.pipe plugins.sass(
            style: 'compressed'
            sourceComments: 'map'
        )
        # .pipe minifyCSS()
        .pipe plugins.rename('main.min.css')
		.pipe gulp.dest(dir.css)
		.pipe plugins.notify('Sass compiled')
		.pipe plugins.livereload()

gulp.task 'build_styles', ['sass'], ->
	gulp.src(dir.lib + '/**/*.css')
		# .pipe plugins.changed(dir.css)
		.pipe plugins.plumber()
		.pipe plugins.watch()
		# .pipe concatCSS('lib.css')
	    .pipe minifyCSS()
	    .pipe plugins.rename('lib.min.css')
	    .pipe gulp.dest(dir.css)
		.pipe plugins.notify('All styles ok')
		.pipe plugins.livereload()



# - Scripts -
# -----------
gulp.task 'coffee', ->
	gulp.src(dir.coffee + '/*.coffee')
		.pipe plugins.plumber()
		.pipe plugins.watch()
		.pipe plugins.coffee(bare: true)
			.on('error', plugins.util.log)
		# .pipe plugins.concat('main.js')
		# .pipe plugins.uglify()
	    .pipe plugins.rename('main.min.js')
		.pipe gulp.dest(dir.js)
		.pipe plugins.notify('CoffeeScript compiled')
		.pipe plugins.livereload()


gulp.task 'bower', ->
# gulp.task 'bower', ['coffee'], ->
	plugins.bowerFiles()
		.pipe plugins.uglify()
		.pipe gulp.dest(dir.js)
		.pipe plugins.notify('Bower rules')


gulp.task 'build_scripts', ->
# gulp.task 'build_scripts', ['bower'], ->
	gulp.src(dir.js + '/**/**/*.js')
		# .pipe plugins.changed(dir.js)
		# .pipe plugins.plumber()
		# .pipe plugins.watch()
	    # .pipe plugins.concat('lib.js')
	    # .pipe plugins.uglify()
	    # .pipe plugins.rename('lib.min.js')
	    .pipe gulp.dest(dir.js)
		.pipe plugins.notify('All scripts ok')
	    .pipe plugins.livereload()


# gulp.task 'build_scripts', ['coffee'], ->
# 	plugins.bowerFiles()
# 		# .pipe plugins.changed(dir.js)
# 		.pipe plugins.plumber()
# 		.pipe plugins.watch()
# 	    .pipe plugins.concat('lib.js')
# 	    .pipe plugins.uglify()
# 	    .pipe plugins.rename('lib.min.js')
# 	    .pipe gulp.dest(dir.js)
# 		.pipe plugins.notify('All scripts ok')
# 	    .pipe plugins.livereload()



# - Others -
# ----------
gulp.task 'php', ->
	gulp.src(dir.php + '*.php')
		.pipe plugins.watch()
		.pipe plugins.livereload()

gulp.task 'twig', ->
	gulp.src(dir.twig + '*.twig')
		.pipe plugins.watch()
		.pipe plugins.livereload()


gulp.task 'default', [
		# 'build_styles'
		'coffee'
		'bower'
		'build_scripts'
		# 'php'
		# 'twig'
	]

