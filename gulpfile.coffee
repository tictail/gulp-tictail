gulp = require 'gulp'
coffee = require 'gulp-coffee'
util = require 'gulp-util'

paths =
  src: './src/**/*'
  dest: './lib/'


gulp.task 'coffee', ->
  gulp.src "#{paths.src}.coffee"
    .pipe coffee bare: true
      .on 'error', util.log
    .pipe gulp.dest paths.dest

gulp.task 'mustache', ->
  gulp.src "#{paths.src}.mustache"
    .pipe gulp.dest('./lib/')

gulp.task 'watch', ->
  gulp.watch paths.src, ['coffee', 'mustache']

gulp.task 'default', ['coffee', 'mustache', 'watch']
