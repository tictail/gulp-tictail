gulp   = require 'gulp'
coffee = require 'gulp-coffee'
util   = require 'gulp-util'

gulp.task 'coffee', ->
  gulp.src './src/*.coffee'
    .pipe coffee({bare: true}).on('error', util.log)
    .pipe gulp.dest('./lib/')

gulp.task 'watch', ->
  gulp.watch './src/*', ['coffee']

gulp.task 'default', ['coffee', 'watch']