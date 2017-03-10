# gulp-tictail

[![NPM](https://img.shields.io/npm/v/gulp-tictail.svg)](https://www.npmjs.com/package/gulp-tictail) [![CircleCI](https://circleci.com/gh/tictail/gulp-tictail.svg?style=shield)](https://circleci.com/gh/tictail/gulp-tictail)

Gulp target for simplifying Tictail theme creation. Please note that this is beta quality software, some template tags are not yet implemented.


### Installation

```bash
$ npm install --save-dev gulp-tictail
```

### Usage

In your `gulpfile.js`:

```javascript
var gulp = require('gulp'),
    tictail = require('gulp-tictail');

gulp.task('serve', function() {
    tictail.serve({
        store_id: 'pf'
    });
});

gulp.task('default', ['serve']);
```

```bash
$ gulp
```

Now hit [http://localhost:5555/](http://localhost:5555/) to enjoy your own delightful theme development experience.

For an opinionated development setup using `gulp-tictail`, see [theme-example](https://github.com/tictail/theme-example).


### Options

The `serve` method takes the following config options as a object:

* `store_id` — The store to fetch data (products etc.) from. Note that this store must be put online.
* `port` — The desired port to listen on. Defaults to `5555`.
* `src` — Path to theme source (theme.mustache) and partials. Defaults to `"./src"`.
* `dist` — Path to static assets (images, CSS etc.) used in theme. Defaults to `"./dist"`.


### Development

```bash
$ git clone https://github.com/tictail/gulp-tictail .
$ npm install coffee-script -g
$ npm install mocha -g
$ npm install
$ make test
```
