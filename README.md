# Field Scheduler

This project provides server-side scheduling functions using node.js and
[lp_solve](http://lpsolve.sourceforge.net/5.5/) to allocate available field
space to a collection of sports teams with an arbitrary number of predefined
preferences.  A simple web app is included for displaying the results.

# Requirements

In addition to a node.js install, the program requires the lp_solve
executable to be in the user's path.


# Solving the scheduling problem

In its current form, the solution of a scheduling problem is computed
statically on the server by the field coordinator, who provides an input
file in JSON format that defines the problem.  The `gen.js` program:

1. reads the problem definition, 

2. converts it into a binary integer programming problem in the
   lp_solve format,

3. spawns a child lp_solve process to solve the program,

4. reads the solution

5. outputs the solution in one of four formats: text-based team
   schedule, text-based field schedule, simple html table, or JSON.

The following command will solve the scheduling problem specified in
`problem.json` and return the results as JSON to `schedule.json`

```bash
% node gen.js problem.json --format=json --output=schedule.json
```

The resulting `schedule.json` file can be used by the webapp to display
the scheduling results.


# Executing the web application
   
The JSON output is used by the web application to display the solution.
The web app is an [angular.js](http://angularjs.org) app served up by
[express](http://expressjs.com).  The schedules are displayed as SVG generated
using [d3.js](http://d3js.org) to convert the JSON data.  

```
% npm install
% node app.js
```

By default, the application listens for requests on `http://localhost:3000`

# Further notes

For those interested (all one of you)...

## The binary integer program

We assume that we're given a set of available fields and the times that
they're available, a set of teams with a list of preferred practice times.
For now, these are assumed to be discrete combinations such as:

   1. mo 4:30pm-6:00pm, we 4:30pm-6:00pm
   2. tu 3:30pm-5:00pm, th 3:30pm-5:00pm
   3. etc...

More general formulations are possible, but preferences like those above
seem consistent with how people express preferences.  In addition to
practice time preferences, general field preferences for each team can be
defined as well.  The above preferences are specifed in a JSON file, for
example:

```js
  { "teams": 
    {
        "GU10_team1": {
            "fpref" : [ "field1","field2" ],
            "req"   : [
                { "mo": [ 1630, 1800 ], "we": [ 1630, 1800 ] },
                { "tu": [ 1530, 1700 ], "th": [ 1530, 1700 ] } ] },
        "BU10_team2": {
            "fpref" : [ "field2","field1" ],
            "req"   : [
                { "mo": [ 1730, 1900 ], "we": [ 1730, 1900 ] },
                { "tu": [ 1430, 1600 ], "th": [ 1430, 1600 ] } ] }
    },
    "fields": {
        "field1": {
            "pretty": "Field 1",
            "cap": 1,
            "slots": {
                "tu": [ 1500, "dusk" ],
                "th": [ 1500, "dusk" ]
            }
        },
        "field2": {
            "pretty": "Field 2",
            "cap": 1,
            "slots": {
                "mo": [ 1500, "dusk" ],
                "we": [ 1500, "dusk" ]
            }
        }
    },
    "others": {}
}
```

To ensure a solution is always found, a dummy "request" for each team is
added that contains no slots.  Choosing this option carries a penalty in the
objective function that prevents its selection unless it can't otherwise be
avoided.  By always reaching some solution, the program can identify where
the conflicts are for the teams assigned to their dummy request.  This
information can be useful for resolving the conflicts.

The program is formulated around decision variables `x` that represent
team-field-time allocations, where time is descretized at some appropriate
level of resolution (e.g. 30 minutes).  We group the decision variables into
_options_, `o`, representing each team's set of requested field slots.

The program takes the general form:

![](http://latex.codecogs.com/gif.latex?%5Ctextrm%7Bmin%3A%7D%20%5CBigg%5C%28%5Csum_%7Bi%20%5Cin%20teams%7D%20%5Csum_%7Bf%20%5Cin%20fields%7D%20%5Csum_%7Bt%20%5Cin%20times%7D%20w_%7Bif%7D%20%5Cmathbf%7Bx%7D_%7Bift%7D%20%5CBigg%29%20%2B%20%5CBigg%5C%28%5Csum_%7Bi%20%5Cin%20teams%7D%5Csum_%7Bj%20%5Cin%20prefs%7D%20p_%7Bi%2Cj%7D%20%5Cmathbf%7Bo%7D_%7Bi%2Cj%7D%20%5CBigg%29)

subject to the following constraints:

   * ![](http://latex.codecogs.com/gif.latex?%5Csum_%7Bj%20%5Cin%20prefs%7D%20%5Cmathbf%7Bo%7D_%7Bi%2Cj%7D%20%3D%201%2C%20%5Cforall%20i%20%5Cin%20teams) (all teams must be assigned to exactly one option)
   * ![](http://latex.codecogs.com/gif.latex?%5CBigg%28%5Cmathbf%7Bo%7D_%7Bij%7D%20%3D%20%5Csum_%7Bf%20%5Cin%20fields%7D%20%5Cmathbf%7Bo%7D_%7Bijf%7D%5CBigg%29%2C%5Cforall%20i%20%5Cin%20teams%2C%20%5Cforall%20j%20%5Cin%20prefs%20%5C%5C%5C%5C%0A%5CBigg%28n%20%5Cmathbf%7Bo%7D_%7Bijf%7D%20%3D%20%5Csum_%7Bt%20%5Cin%20slots_%7Bij%7D%7D%5Cmathbf%7Bx%7D_%7Bift%7D%5CBigg%29%2C%20%5Cforall%20i%20%5Cin%20teams%2C%20%5Cforall%20j%20%5Cin%20prefs%2C%20%5Cforall%20f%20%5Cin%20fields) (each of a team's options may be satisfied by assignment of the team to exactly one of the fields for all of the requested time slots)
   * ![](http://latex.codecogs.com/gif.latex?%5CBigg%28%5Csum_%7Bi%20%5Cin%20teams%7D%20%5Cmathbf%7Bx%7D_%7Bift%7D%20%5Cle%20cap_f%20%5CBigg%29%2C%20%5Cforall%20f%20%5Cin%20fields%2C%20%5Cforall%20t%20%5Cin%20slots) (fields can't be used beyond their capacity at any point in time)
   * ![](http://latex.codecogs.com/gif.latex?%5cmathbf%7Bx%7D_%7Bift%7D%5Cin%5C{0%2C1%5C}%2C%20%5Cforall%20i%2C%5Cforall%20f%2C%5Cforall%20t) and ![](http://latex.codecogs.com/gif.latex?%5cmathbf%7Bo%7D_%7Bij%7D%5Cin%5C{0%2C1%5C}%2C%20%5Cforall%20i%2C%5Cforall%20j) (decision variables are binary)

where:

   * ![](http://latex.codecogs.com/gif.latex?%5Cmathbf%7Bx%7D_%7Bift) is 1 if `team i` is assigned `field f` at  `time t`.  Note, for our purposes here, time actually represents a day of week and time of day
   * ![](http://latex.codecogs.com/gif.latex?w_%7Bift) is a weighting parameter for representing `team i`'s relative preference for `field f`.  These are inferred from the ordering of the `fpref` field above in the example JSON block.
   * ![](http://latex.codecogs.com/gif.latex?%5Cmathbf%7Bo%7D_%7Bij) is 1 if `team i` is assigned to its `preference j`.
   * ![](http://latex.codecogs.com/gif.latex?p_%7Bij) is a weighting parameter for representing `team i`'s relative preference for `option j`.  These are inferred from the ordering of the `req` array above in the example JSON block.  Generally, the ordering is scaled to ensure a greedy selection.


## Preprocessing

The `gen.js` script generates a program with soft constraints that
guarantees a solution is found, but that also admits solutions in which
not all teams are scheduled.  That being said, the program is structured
such that solutions in which all teams are schedule will _always_ by
preferred over solutions in which some teams remain unscheduled.
