'use strict';

/* Services */


// Demonstrate how to register services
// In this case it is a simple value service.
angular.module('myApp.services', ['ngResource']).
  value('version', '0.1')
    .factory('Schedule',function($resource) {
        return $resource('/api/schedule/:sched', {sched:'@sched'}, {
            query: {method: 'GET', params:{sched:'list'}, isArray: true}
        })
    })
