var express = require('express');
var router = express.Router();

/* GET users listing. */
router.use(express.static(__dirname+ '/../public'));
router.use("/css",  express.static(__dirname + '/../public/css'));
router.use("/js", express.static(__dirname + '/../public/js'));
router.use("/img",  express.static(__dirname + '/../public/img'));
router.use("/res",  express.static(__dirname + '/../public/res'));
router.use("/maestros",  express.static(__dirname + '/../public/maestros'));

router.get('/:projectid', function(req, res, next) {
	console.log(__dirname);
  res.render('contact', { layout: 'wlayout.hbs'});
});

module.exports = router;
