
# Treasure Hunt App
"Forgeschrittene Softwaretechnik"  
WS 2020/2021

*<div>App Icon made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>  
Picture in Create- and EditTreasureHuntView made by <a href="https://unsplash.com/photos/RFId0_7kep4">N.</a>  
Picture in DetailedHuntView made by <a href="https://unsplash.com/photos/1-29wyvvLJA">Andrew Neel</a>.  
Both pictures were taken from <a href="https://unsplash.com/">www.unsplash.com</a></div>*

**The Application**  

The app enables you to create own treasure hunts that you can use to go on little adventures with.  

You have a StartView from which you get to the instructions and a list of available treasure hunts where you can also delete them.  
With the button at the bottom you can create new ones.   

<img src="Screenshots/phone.png" width="150"> <img src="Screenshots/start_view.png" width="150"> <img src="Screenshots/instructions_view.png" width="150"> <img src="Screenshots/list_view.png" width="150"> <img src="Screenshots/list_view_delete.png" width="150">  


This is what the view for creating a hunt looks like. You can pass in a name, description and also add several checkpoints.  

<img src="Screenshots/create_hunt_filled_out.png" width="150"> <img src="Screenshots/create_checkpoint_view.png" width="150">  


This is what the detailed view of a treasure hunt looks like. If the checkpoints haven't been reached/checked off yet they are hidden.  
With the edit option you can also change the hunts after you've created them (e.g. delete a checkpoint again).

<img src="Screenshots/detailed_hunt_view.png" width="150"> <img src="Screenshots/edit_hunt_view_del.png" width="150">  


Once you've started a hunt the MapView looks like this. When you've reached a checkpoint it will be annotated on the map with a pin and the detailed view will also be updated:  

<img src="Screenshots/map_view_hint.png" width="150"> <img src="Screenshots/detailed_hunt_checked_view.png" width="150">  


When you've finished a treasure hunt a finished view will appear and the map will have all checkpoints visible. They can also be seen in the detailed view.  

<img src="Screenshots/finished_view.png" width="150"> <img src="Screenshots/finished_map_view.png" width="150"> <img src="Screenshots/detailed_hunt_finished_view.png" width="150">  



**1. UML Diagrams**

All UML diagrams can be found in the [UML folder](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams).  

1. For the Class Diagram click [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams/Class_Diagram.png)  
	<img src="Diagrams/Class_Diagram.png" width="400">  
	<br>
2. For the Use-Case Diagram click [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams/Use_Case_Diagram.png)  
	<img src="Diagrams/Use_Case_Diagram.png" width="350">  
	<br>
3. For the Sequence Diagram click [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams/Sequence_Diagram.png)  
	<img src="Diagrams/Sequence_Diagram.png" width="400">  

**2. Domain-Driven Design (DDD)**  
<img src="Diagrams/DDD_Diagram.png" width="400">  
This is what the Domain could look like (With investors, third parties, a user management system etc.)  
For the DDD Diagram in large click [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams/DDD_Diagram.png).  

**3. Metrics**  
For metrics SonarQube is used (run locally) and Fastlane for gathering the SonarQube metrics. The configuration can be found in the [sonar-project.properties file](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/sonar-project.properties). It, amongst other things, checks for Maintainability (Code Smells,...), Duplications and Code Coverage (with Cobertura) and Code Complexity (with Lizard).  
The configuration for Swiftlint (a tool to enforce Swift style and conventions, used for the code smells metric) can be found in [.swiftlint.yml](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/fastlane/.swiftlint.yml). This is also used with SonarQube.  
<img src="Screenshots/sonarqube.png" width="400">  
<img src="Screenshots/sonarqube_overview.png" width="400">  
(The project passes the quality gate because the minimum code coverage here was set to 45%. Normally this should be, in the best case, around 80%.)  
The reports can be found in the [sonar-reports folder](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/sonar-reports).

**4. Clean Code Development (CCD)**  
For the CCD cheat-sheet in large click [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Diagrams/CCD_Sheet.png).  
<img src="Diagrams/CCD_Sheet.png" width="500">  

1. Naming  
	Naming conventions described in the cheat sheet are being kept.  
	For example: The methods in the [CreateTreasureHuntView](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/View/CreateTreasureHuntView.swift) class are named according to what they do. And all Views and Models have descriptive names.
2. Class Design  
	Different functionalities are separated into different classes and methods. You can see this in the above mentioned example as well.  
	Extensions can be added to classes without modifying them. For example see the [Checkpoint](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/Model/Checkpoint%2BCoreDataProperties.swift) or [TreasureHunt](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/Model/TreasureHunt%2BCoreDataProperties.swift) classes.
3. Maintainability  
	Duplications are avoided. For example: The [ViewModifiers](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/View/DSL-Example/DSL_Example.swift) are being kept at a common place to avoid repetition.
4. Testing  
	Unit tests are implemented which are fast, repeatable and independent from one another. See the [test folder](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/TreasureHuntAppTests).  
	Code Coverage and other metrics are also being tested with [SonarQube](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/sonar-project.properties).
5. Code Smells  
	Source code conventions like line length, function length and number of parameters are not being violated.  
	These Code Smells are also being checked with [swiftlint](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/fastlane/.swiftlint.yml).

**5. Build**  
For this project Fastlane is used which is an open source build automation tool for Android and iOS for developers. In [Gemfile](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/Gemfile) we describe the gem dependencies required (like Fastlane).
The configuration files for Fastlane can be found in the [fastlane folder](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/fastlane):

1. Appfile:  
	The Appfile stores useful information that are used across all fastlane tools (e.g. Apple ID, application Bundle Identifier,...) to deploy lanes faster and tailored on the project needs.
2. Fastfile:  
	The Fastfile stores the automation configuration that can be run with fastlane. Here you find different lanes I implemented. For example one called _test\_app_ for testing (and publishing the application reports to sonar via the _publish\_reports\_to\_sonar_ lane), one called _beta_ for building (produces, amongst other things, an ipa file - an iOS application archive file which stores an iOS app - and puts it in a build folder in the jenkins workspace (local) and also a lane called _lint_ for testing swiftlint.  
	We can use these lanes with, for example, this command executed in the project folder: _fastlane test\_app_
3. Scanfile:  
	Scan is an alias for the run_tests action. It's to run tests of the iOS app on a simulator or connected device. The configuration for that can be found in the Scanfile. Reports about the test results (in html and junit format) are put in the reports folder (also in the local workspace).
4. Gymfile:  
	Gym builds and packages iOS apps and is part of fastlane. It is an alias for the build_app action. The configuration for the build is done in this file.
5. Matchfile:  
	Match is an alias for the sync\_code\_signing action. It's to simplify the codesigning setup and prevent code signing issues across a team of developers (if there's more than one).


**6. Unit-Tests**  
See Test Folders: [Tests](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/TreasureHuntAppTests) and [UITests](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/TreasureHuntAppUITests)  
Test reports can also be found in the [sonar-reports folder](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/sonar-reports) (html-TEST-report and TEST-report).

**7. Continuous Integration/Continuous Delivery (CI/CD)**  
For CI/CD Jenkins + Fastlane are used. The configuration/pipeline can be found in the [Jenkinsfile](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/pipelines/Jenkinsfile).  
You can also see the different stages in Jenkins' stage view:  

<img src="Screenshots/jenkins_stage_view.png" width="500">

And also the changes that have been made:  

<img src="Screenshots/jenkins_changes.png" width="300">

When something is being pushed to the git repository a job in Jenkins is being triggered via webhook. Since Jenkins is run locally ngrok is used which provides public URLs (creates a secure tunnel from a public endpoint to a locally running web service).  

<img src="Screenshots/ngrok.png" width="250"> <img src="Screenshots/git_webhook.png" width="300">  

Defined recipients are notified via email when a build starts and also receive an email when a build has finished with the respective build status:  

<img src="Screenshots/mail_notification_build_started.png" width="400"> <img src="Screenshots/mail_notification_build_finished.png" width="400">  

**8. IDE**  
For this project XCode 12.2 was used. Some very useful shortcuts were the following:

| Shortcut      			| Description                    				  			|
| ------------------------- | --------------------------------------------------------- |
| Command+Shift+O   		| Open quickly: Find a file quickly and open it.   			|
| Option/Alt+Click  		| See the declaration of a variable.     		   			|
| Command+Click		    	| To jump to the definition of a variable/function etc., to e.g. embed View in HStack...	|
| Command+Option+Enter  	| Open/close the Preview window of Views.		   			|
| Command+Option+P		  	| Load Preview.		   										|
| Command+Shift+F		  	| Search for something in the project.				   		|
| Command+Shift+7	  		| Comment in/out blocks or lines of code.     	   			|
| Command+B			  		| Build. 							    		   			|
| Command+U			  		| Run Tests.						     		   			|

This project uses the framework SwiftUI to build user interfaces. With that we're also able to quickly modify and build our views with the preview feature and attributes inspector in Xcode.

**9. Domain-Specific Language (DSL)**  
You can find an example for internal DSL [here](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/View/DSL-Example/DSL_Example.swift):  
SwiftUI itself is already kind of a DSL that simplifies building a UI. The implemented ViewModifiers in this project can be used to modify views by just simply adding, here for example, modifyAdd(). In CreateTreasureHuntView it is used like this:  
```swift
Button(action: {
    showCreateCheckpointSheet = true
}, label: {
    Text("Add Checkpoint").modifyAdd()
})
```  
It's a functional, Domain Specific Language for interface declaration.  

**10. Functional Programming**  
For final data structures: For example almost all variables of the [CheckpointCreateModel](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/Model/CheckpointCreateModel.swift) viewmodel are declared as let variables which means they are final.  
And the Views are of type struct which are also immutable, so their var's are also final.  
Different functionalities are also separated into different methods in order to provide side-effect free functions (e.g. the functions in [MapView](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/blob/main/TreasureHuntApp/View/MapView.swift)).  
Use of higher-order functions (when functions are used as parameters and/or return values and closures/anonymous functions are used.): This is, for example, the case with the timer and updateCheckpoint() method in the MapView.  
And throughout almost all View classes you can find closures as parameters for functions: For example with buttons, functions are given as closures for the action parameter. The functions are then being run when the button is clicked.
