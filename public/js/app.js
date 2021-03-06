'use strict';


// Declare app level module which depends on filters, and services
var app = angular.module('myApp', ['myApp.filters', 'myApp.services', 'myApp.directives', 'ui', 'ui.bootstrap','ui.bootstrap.dialog']).
    config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
        $routeProvider.when('/tableview', {templateUrl: 'partials/partial1', controller: MyCtrl1});
        $routeProvider.when('/chartview/:sched', {templateUrl: 'partials/partial2', controller: MyCtrl3});
        $routeProvider.when('/chartview', {templateUrl: 'partials/partial2', controller: MyCtrl2});
        $routeProvider.when('/doc', {templateUrl: 'partials/readme', controller: DocCtrl})
        $routeProvider.otherwise({redirectTo: '/chartview'});
        $locationProvider.html5Mode(true);
  }]);
