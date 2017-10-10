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
  res.render('index', { layout: 'layout.hbs' })
});

module.exports = router;
