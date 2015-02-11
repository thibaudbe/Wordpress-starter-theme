Wordpress starter theme
===

Using Timber plugin, Sass, Ajax & Gulpjs. A SEO friendly theme, implemented for designer.


## Features

This theme couldn't exist without these following projects :

- [Timber](http://jarednova.github.io/timber/)
- [Ajax crawling](https://developers.google.com/webmasters/ajax-crawling/)
- [Bower](http://bower.io/)
- [Sass](http://sass-lang.com/)
- [CoffeeScript](http://coffeescript.org/)
- [Gulp.js](http://gulpjs.com/)



## How to use it ?

### Timber 

First, you need to install [Timber plugin](http://wordpress.org/plugins/timber-library/) from the [Timber project](http://jarednova.github.io/timber/) to use this theme.


### Bower packages

Install **Bower** packages in directory using `cd your_project`

	bower update
	
To add more packages

	bower search package_name
	bower install package_name

And path them packages to your **twig** file

	bower list
	bower list --paths
	

### Gulp tasks 

Run `gulpfile.coffee`

	gulp --require coffee-script/register

It will listen a local livereload on **35729** port, and also compile, minify, concatenate your **Sass** & **CoffeeScript** in a build folder. All your bower main files uploaded in `src > lib` will be copy in `build > lib` and minify.


### Credits

Thanks to [Seomix](http://www.seomix.fr/navigation-ajax/) for the inspiration.


[![Analytics](https://ga-beacon.appspot.com/UA-59640055-1/Wordpress-starter-theme/readme)](https://github.com/igrigorik/ga-beacon)
