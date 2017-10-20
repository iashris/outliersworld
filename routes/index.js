var express = require('express');
var router = express.Router();
var path=require('path');
var gsheet=require('gsheet-web');
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
router.get('/resources', function(req, res, next) {
	gsheet('1XrDALyA84t4jT3Mh2WdhAd_lzpyc9eSfT_n5MoV1bOA', (data)=>{
  console.log('Try callback ', data.length);  // array of objects
 // res.render('resources', { layout: 'layout.hbs' })
 res.send(data);

});

});


module.exports = router;
