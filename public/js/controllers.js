'use strict';

/* Controllers */

function format_team(tm) {
        return tm.split("X").join("/").split("_").join(" ")
}

function AppCtrl($scope, $http, $dialog) {
    $scope.displayedField = 0;

    var colors20 = d3.scale.category20();

    $scope.colors = {};

    $scope.team_style = function(tm) {
        return $scope.colors[tm] ? "color:#333; text-shadow: 1px 1px #aaa; background-color: "+$scope.colors[tm] : "";
    }


    $scope.format_time = function(t) {
        return [Math.floor(t/100),(''+t).slice(-2)].join(":")
    }

    $scope.format_request = function(req) {
        return _.map( _.keys(req), function(d) { 
            return d + " " + merge_times(req[d]) 
        } ).join(", ")
    }

    $scope.timestep = 15;

    $scope.isBeforeTwilight = function(t) {
        var ct = new Date($scope.twilight[0].civil_twilight)
        var tt = ct.getHours()*100+ct.getMinutes()
        return (t < tt)
    }

    $scope.format_team = format_team

    $scope.format_field = function(f) {
        return $scope.schedule.fields && $scope.schedule.fields[f] 
            ? $scope.schedule.fields[f].pretty : f;
    }

    $scope.openTeamDialog = function( team ) {

        $scope.dialogOpts = {
            backdrop: true,
            keyboard: true,
            backdropClick: true,
            controller: 'TeamDialogController',
            resolve: {team: angular.copy(team), sched: 'schedule'}
        };
    
        var d = $dialog.dialog($scope.dialogOpts)
        d.open('partials/team-dialog','TeamDialogController')
    }

                
    var today = new Date();
    today.setHours(3)
    today.setMinutes(0)
    today.setSeconds(0)
    today.setMilliseconds(0)
    var mon = angular.copy(today).add(1).day().previous().monday()
    var sun = angular.copy(today).add(-1).day().next().sunday()

    $scope.basedate = angular.copy(mon)

    $http({method: 'GET', 
           url: '/api/twilight/'+[mon.getMonth()+1,mon.getDate(),sun.getMonth()+1,sun.getDate()].join("/")}).
        success(function(data, status, headers, config) {
            $scope.twilight = data

            $http({method: 'GET', url: '/data/schedule.json'}).
                success(function(data, status, headers, config) {
                    $scope.schedule = data;
                    console.log($scope.schedule)
                    $scope._ = _;
                    
                    _.each(_.keys($scope.schedule.teamsched),function(k,i) {
                        $scope.colors[k] = colors20(i)

                        if ( k.match(/(League|Lacrosse|Rugby)/ ) ) {
                            // override leagues
                            var c = 5 + (i%4); // make them shades of gray
                            $scope.colors[k] = "#"+c+c+c;
                        }


                    });

                    
                    $scope.status = 'Good!'
                }).
                error(function(data, status, headers, config) {
                    $scope.status = 'Error Getting Schedule!'
                });
        }).
        error(function(data, status, headers, config) {
            $scope.status = 'Error Getting Twilight!'
        });

    $scope.setField = function(i) {
        $scope.displayedField = i;
    }

    $scope.sched = function(field,d,t) {
        if ($scope.schedule.sched[field] 
            && $scope.schedule.sched[field][d] 
            && $scope.schedule.sched[field][d][t] ) {
            return ["scheduled",$scope.schedule.sched[field][d][t]].join(" ")
        } else {
            if ( $scope.schedule.fields[field].slots[d] 
                 && _.indexOf($scope.schedule.fields[field].slots[d], parseInt(t)) != -1 ) 
                return "available"
            else
                return "closed"
        }
        return "error";
    }
    $scope.isSched = function(field,d,t) {
        return $scope.sched(field,d,t).match(/scheduled/);
    }
}


app.controller(
    'TeamDialogController', 
    ['$scope','dialog','team','sched', function( $scope, dialog, team, sched) {
        
        $scope.team = team
        $scope.schedule = sched

        $scope.format_team = format_team

        $scope.format_team_sched = function(tm) {
            var s = "<ul>";
            _.each(_.sortBy(_.keys($scope.schedule.teams[tm]),function(k) { return dorder[k] }), function(d) {
                var tarr = _.sortBy(_.keys($scope.schedule.teams[tm][d]),function(t) {return parseInt(t);})
                while( tarr.length > 0 ) {
                    t = tarr[0]
                    var ts = merge_times(tarr);
                    s += d+" from "+ts+" @ "+$scope.format_field($scope.schedule.teams[tm][d][t])
                }
            });
            s += "</ul>"
            return sl;
        }

        $scope.close = function(result){
            dialog.close(result)
        }
    }]);

function MyCtrl1($scope,$http) {    
}
MyCtrl1.$inject = ['$scope','$http'];


function MyCtrl2() {
}
MyCtrl2.$inject = [];
