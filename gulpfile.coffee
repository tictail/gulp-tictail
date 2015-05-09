gulp   = require 'gulp'
coffee = require 'gulp-coffee'
util   = require 'gulp-util'

gulp.task 'coffee', ->
  gulp.src './src/**/*.coffee'
    .pipe coffee({bare: true}).on('error', util.log)
    .pipe gulp.dest('./lib/')

gulp.task 'mustache', ->
  gulp.src './src/views/*.mustache'
    .pipe gulp.dest('./lib/views/')

gulp.task 'watch', ->
  gulp.watch './src/**/*', ['coffee', 'mustache']

gulp.task 'build', ['coffee', 'mustache']

gulp.task 'default', ['build', 'watch']