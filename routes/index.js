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
	//Load Outliers Projects DB and send all projects for projects to render
	gsheet('1sFlWBjlFLCOXvl-PixptFTBwAj-2uUNF4A8oMBxmrds', (data)=>{
		console.log(data);
	 res.render('projects', { layout: 'wlayout.hbs' ,'data':data})
	});
});
router.get('/project/:projectid',function(req,res){
		gsheet('1sFlWBjlFLCOXvl-PixptFTBwAj-2uUNF4A8oMBxmrds', (data)=>{
		//load correct data
		//get likes for project
	 res.render('projects', { layout: 'wlayout.hbs' ,'data':data})
	});
});
router.get('/contact', function(req, res, next) {
  res.render('contact', { layout: 'wlayout.hbs' })
});
router.get('/clusters', function(req, res, next) {
  	gsheet('1XrDALyA84t4jT3Mh2WdhAd_lzpyc9eSfT_n5MoV1bOA', (data)=>{
	 var DATA={};
	 res.render('clusters', { layout: 'wlayout.hbs' ,'data':DATA})
	});
});
router.get('/resources', function(req, res, next) {
	//gsheet('1ZEyivQwtoQwNdXLCSkGXtlOxUvAV2kbXYhA1XLzMJcQ/edit#gid=226239407', (data)=>{

  //console.log('Try callback ', data.length);  // array of objects
 res.render('resources', { layout: 'wlayout.hbs' })
 //res.send(data);

//});

});


module.exports = router;
