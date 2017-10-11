var express = require('express');
var router = express.Router();
var path=require('path');
/* GET home page. */
router.get('/', function(req, res, next) {
  var viewOpts = { root: __dirname };
  res.sendFile('index.html');
});
router.get('/home',function(req,res,next){
	res.render('home',{layout:'layout.hbs'})
});
router.get('/projects', function(req, res, next) {
  res.render('projects', { layout: 'layout.hbs' })
});
router.get('/contact', function(req, res, next) {
  res.render('contact', { layout: 'layout.hbs' })
});
router.get('/clusters', function(req, res, next) {
  res.render('clusters', { layout: 'layout.hbs' })
});


module.exports = router;
