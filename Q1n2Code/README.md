# Goodship automation
This section contains end to end automation for goodship: TPB,PP,PMS,OMS; 

### Setup local
	# clone HB-Automation repo
	$ git clone git@github.com:honestbee/HB-Automation.git <local_repo_name>

	# go to local repo path
	$ cd <local_repo_name>/HB-GoodShip/GoodshipE2E

### Setup data
	# change the needed data in config file
	$ config file can be found under <local_repo_name>/HB-GoodShip/GoodshipE2E/features/support
	
	# update values on the data file to be uploaded for goodship order creation
	$ data file can be found under <local_repo_name>/HB-GoodShip/GoodshipE2E/ and update this with the values for goodship order creation

### Running admin panel tests
	#browser supported
	BROWSER: chrome

### Running  tests
	# commands to run the the feature file with report 
	$cucumber -r features --name LoginTPB BROWSER='chrome' --format html --out report.html --format pretty
	
	# commands to run the feature file without report
	$ cucumber -r features --name LoginTPB BROWSER='chrome'
	
	#following are the various test runs (you can choose to run them with or without report generation based on the above commands):
	$ cucumber -r features --name LoginTPB BROWSER='chrome'
	$ cucumber -r features --name LoginPP BROWSER='chrome'
