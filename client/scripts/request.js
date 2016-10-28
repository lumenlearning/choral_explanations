var request = require('superagent');
var settings = require('./_settings').default;

var Request = function () {
  var baseURL = settings.apiUrl + "/";

  this.put = function (route, payload, next) {
    let req = request.put(baseURL + route).send(payload);
    add_header_info(req, next)
  };

  this.post = function (route, payload, next) {
    let req = request.post(baseURL + route).send(payload);
    add_header_info(req, next)
  };

  this.get = function (route, payload, next) {
    let req = request.get(baseURL + route).query(payload);
    add_header_info(req, next)
  };

  this.del = function (route, payload, next) {
    let req = request.del(baseURL + route).query(payload);
    add_header_info(req, next)
  }

  function add_header_info(req, next) {
    if (settings.jwt !== "") {
      req = req.set("Authorization", settings.jwt)
    }

    req.set("Accept", 'application/json')
        .set("Content-Type", 'application/json')
        .end(function (err, res) {
          return next(err, JSON.parse(res.text), res);
        });
  }

};

module.exports = Request;
