var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');

var app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.set('views', path.join(__dirname, 'templates'));
app.set('view engine', 'ejs');

/********************************/
/*          index.ejs           */
/********************************/
app.get('/', function (req, res) {
        return res.render('index');
});

/********************************/
/*           form.ejs           */
/********************************/
app.get('/form', function (req, res) {
	return res.render("form");
});

app.post('/form', function (req, res) {
	return res.render("result", {data: req.body});
});

app.listen(3000, function () {
});
