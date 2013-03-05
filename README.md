# Sports Field Scheduler

Written to solve the problem of allocating available field space to a
collection of sports teams with an arbitrary number of predefined
preferences, this project provides server-side scheduling functions
using node.js and [lp_solve](http://lpsolve.sourceforge.net/5.5/) with a
simple web app for displaying the results.

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
The web app is an [angular.js](angularjs.org) app served up by
[express](expressjs.com).  The schedules are displayed as SVG generated
using [d3js](d3js.org) to convert the JSON data.  


# Further notes

The `gen.js` script generates a program with soft constraints that
guarantees a solution is found, but that also admits solutions in which
not all teams are scheduled.  That being said, the program is structured
such that solutions in which all teams are schedule will _always_ by
preferred over solutions in which some teams remain unscheduled.

## The binary integer program

The program has the general form:

!(http://latex.codecogs.com/gif.latex?%5Csum_%7Bi+%5Cin+teams%7D%5Csum_%7Bj+%5Cin+prefs%7D+p_%7Bi%2Cj%7D+o_i)

