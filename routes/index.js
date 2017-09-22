var express = require('express');
var router = express.Router();
var path=require('path');
/* GET home page. */
router.get('/', function(req, res, next) {
  var viewOpts = { root: path.join(__dirname,'welcome') };
  res.sendFile('index.html',viewOpts);
});

module.exports = router;
