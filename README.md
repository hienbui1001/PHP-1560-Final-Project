# PHP-1560-Final-Project

This github repository aims to address the question of "How is RIPTA underperforming
when it comes to transfers." In order to tackle this question, we have put together
many different scripts that lead directly to where the issues in transfers lie.

The scripts within this repository are very simple. All scripts that contain functions
needed for executing the research question are contained within the "Pipeline" folder.
The "pipeline.R" script itself is outside of the "Pipeline" folder for easy access.

Be sure you set your working directory to this github repository.

Once set,, please insert your RIPTA data into the script
named "clean_data.R" on line 4 where it says "[insert RIPTA data HERE]"

From this point on, simply run the script named "pipeline.R". This script will run
all the scripts and functions in the correct order and produce the visualizations 
for your findings.

While, this repository does not directly fix the transfer issues, it pinpoints 
exactly where and what is needed to optimize the RIPTA transfer system. In order
to understand the visualizations, you must understand the optimization scoring system
put into place. Theoretically, the perfect route/day optimization score would be 0.
The farther a number is from zero the more change needs to happen at that point.
Positive numbers indicating a lack of direct routes and negative numbers indicating
a poorly-connected network. Using those visualizations you can pinpoint exactly
what routes or days need work.