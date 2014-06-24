Checklist: event-reporter
==============

#### A. Happy Path

[  ] `load event_attendees.csv`<br />
[  ] `queue count` should return `0`<br />
[  ] `find first_name John`<br />
[  ] `queue count` should return `63`<br />
[  ] `queue clear`<br />
[  ] `queue count` should return `0`<br />
[  ] `help` should list the commands<br />
[  ] `help queue count` should explain the queue count function<br />
[  ] `help queue print` should explain the printing function<br />


#### B. Let’s Try Printing

[  ] `load`<br />
[  ] `queue count` should return `0`<br />
[  ] `find first_name John`<br />
[  ] `find first_name Mary`<br />
[  ] `queue print` should print out the 16 attendees<br />
[  ] `queue print by last_name` should print the same attendees sorted alphabetically by last name<br />
[  ] `queue count` should return `16`<br />

#### C. Saving

[  ] `load` <br />
[  ] `find city Salt Lake City` <br />
[  ] `queue print` should display 13 attendees <br />
[  ] `queue save to city_sample.csv` <br /> 
[  ] Open the CSV and inspect that it has correct headers and the data rows from step 3.<br /> 
[  ] `find state DC`<br /> 
[  ] `queue print by last_name` should print them alphabetically by last name<br /> 
[  ] `queue save to state_sample.csv`<br /> 
[  ] Open the CSV and inspect that it has the headers, the data from step 7, but not the data previously found in step 2.<br /> 



#### D. Reading Your Data

[  ] `load`<br /> 
[  ] `find state MD`<br /> 
[  ] `queue save to state_sample.csv`<br /> 
[  ] `quit`<br /> 

_Restart the program and continue…_<br /> 

[  ] `load state_sample.csv`<br /> 
[  ] `find first_name John`<br /> 
[  ] `queue count` should return `4`<br /> 


#### E. Emptiness

Note that this set intentionally has no call to `load`:<br /><br />
[  ] `find last_name Johnson`<br />
[  ] `queue count` should return `0`<br />
[  ] `queue print` should not print any attendee data<br />
[  ] `queue clear` should not return an error<br />
[  ] `queue print by last_name` should not print any data<br />
[  ] `queue save to empty.csv` should output a file with only headers<br />
[  ] `queue count` should return 0<br />
