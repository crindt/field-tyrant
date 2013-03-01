/*
 * Serve JSON to our AngularJS client
 */

exports.name = function (req, res) {
    res.json({
  	name: 'Bob'
    });
};

exports.solution = function(req, res) {
    
};
