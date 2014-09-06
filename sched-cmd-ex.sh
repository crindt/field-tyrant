node gen.js -ap -d 1830 -i data/fall-2014.json --format=json -o public/sched/fall-2014-sched.json -- --presolve --timeout 10
node ss.js -s "Cardiff Soccer Fall 2014 Practice Schedule v5" -d fall-2014
