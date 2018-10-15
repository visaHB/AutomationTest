# Automation Test 
This section contains the scripts for Q1 and Q2

### Setup local
	# clone repo
	$ git clone git@github.com:visaHB/AutomationTest.git

	# go to local repo path
	$ cd <local_repo_name>/Q1n2Code

### Setup data
	# change the needed data in config file
	$ config file can be found under <local_repo_name>/Q1n2Code/features/support
	
	# update values on the data file to be used as account details while doing a new sign up
	$ data file can be found under <local_repo_name>/HB-Q1n2Code and update this with the values of the new account details to be used while doing a sign up

### Running admin panel tests
	#browser supported
	BROWSER: chrome

### Running  tests
	# commands to run the the feature file with report 
	$cucumber -r features --name SignUp BROWSER='chrome' --format html --out report.html --format pretty

	
	# commands to run the feature file without report
	$ cucumber -r features --name SignUp BROWSER='chrome'
	
	#following are the various test runs (you can choose to run them with or without report generation based on the above commands):
	$ cucumber -r features --name SignUp BROWSER='chrome'
	$ cucumber -r features --name SignIn BROWSER='chrome'
