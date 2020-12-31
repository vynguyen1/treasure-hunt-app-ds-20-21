
# Treasure Hunt App
"Forgeschrittene Softwaretechnik"  
Data Science MSc at Beuth University Berlin  
WS 2020/2021

**1. UML Diagrams**

1. Class Diagram  
	*In the making...*
2. Use-Case Diagram  
	*In the making...*
3. Sequence Diagram  
	*In the making...*

**2. Domain-Driven Design (DDD)**  
*In the making...*

**5. Metrics**  
*In the making...*

**6. Clean Code Development (CCD)**  
*In the making...*

**7. Build**  
*In the making...*

**8. Unit-Tests**  
See Test Folders: [Tests](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/TreasureHuntAppTestsm) and [UITests](https://github.com/vynguyen1/treasure-hunt-app-ds-20-21/tree/main/TreasureHuntAppUITests)

*More tests are in the making!*

**9. Continuous Integration/Continuous Delivery (CI/CD)**  
*In the making...*

**10. IDE**  
For this project XCode 12.2 was used. Some very useful shortcuts were the following:

| Shortcut      			| Description                    				  			|
| ------------------------- | --------------------------------------------------------- |
| Command+Shift+O   		| Open quickly: Find a file quickly and open it.   			|
| Option/Alt+Click  		| See the declaration of a variable.     		   			|
| Command+Click		    	| To jump to the definition of a variable/function etc.		|
| Command+Option+Enter  	| Open/close the Preview window of Views.		   			|
| Command+Option+P		  	| Load Preview.		   										|
| Command+Shift+F		  	| Search for something in the project.				   		|
| Command+Shift+7	  		| Comment in/out blocks or lines of code.     	   			|
| Command+B			  		| Build. 							    		   			|
| Command+U			  		| Run Tests.						     		   			|

This project uses the framework SwiftUI to build user interfaces. With that we're also able to quickly modify and build our views with the preview feature and attributes inspector in Xcode.

**11. Domain-Specific Language (DSL)**  
*This part is currently still missing, working on it.*

**12. Functional Programming**  
Only final data structures:  
All variables of the Viewmodels are declared as let variables which means they are final. Views are of type struct which are also immutable, so their var's are also final.
Use of higher-order functions (When functions are used as parameters and/or return values and closures / anonymous functions are used.):    
This is the case with the map, reduce and filter functions used on arrays. In this project see for example the use of filter in LocationComponent.getLocationOfCurrentCheckpoint() or closures as predicate parameter for the firstIndex function in CheckpointComponent.findCheckpoint().  
Also for example with buttons, functions are also given as closures for the action parameter. The functions are then being run when the button is clicked.

*Rest is in the making...*  