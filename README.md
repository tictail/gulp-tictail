# gulp-tictail

[![Build Status](https://travis-ci.org/tictail/gulp-tictail.svg?branch=master)](https://travis-ci.org/tictail/gulp-tictail)

Gulp target for simplifying Tictail theme creation.

### Installation
```bash
$ npm install --save-dev gulp-tictail
```

### Usage
```javascript
var gulp = require('gulp'),
    tictail = require('gulp-tictail');

gulp.task('serve', function() {
  tictail.serve();
});

gulp.task('default', ['serve']);
```

Now hit [http://localhost:5555/](http://localhost:5555/) to enjoy your own delightful theme development experience.
