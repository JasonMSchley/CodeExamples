- [Salesforce Trailhead](https://www.salesforce.com/trailblazer/jasonmschley)
- [Linkedin](https://www.linkedin.com/in/jason-schley/)

# Read All About Me
"Hello! My name is Jason Schley, and i am a Salesforce developer. I have both Admin and PD1 certificate.  I have honed my skills in Sales Cloud and Service Cloud when i was workering at a toy gun company as i was managing a database where i had to do alot of manual logic processes that now i know could have easily be accomplished with Salesforce. I enjoy tackling challenges and finding innovative solutions, whether it's through programatic or declarative solutions. In my free time, I play video games such as "Oxygen Not Included" or "Factorio, which are type of games where you dont directly control the characters, instead you set up systems with roles and profiles to have the characters setup chains of processes that remind me of Flows. I am always eager to learn and grow, and I look forward to contributing my skills and enthusiasm to new opportunities."
## Previous Project
"During a previous project called 'Gamified LMS Solution Version 7' or 'Trail of the Titans,' we developed an in-house tracking method for training. This project involved multiple cohorts working collaboratively on a single codebase handed down from previous groups. As part of my cohort, our task was to implement a three-stage approval process for QA questions for trainees' records. While the task seemed straightforward, we encountered challenges such as package dependencies and typos, which often required extensive time and effort to locate and resolve issues."
## Greatest Weakness
"Besides my speech issue, where I occasionally lose control over my tongue, my greatest weakness is my ability to find bugs in a system. While this might sound like a strength, it often leads to unintended complications. For instance, when using Focus on Force to study for my PD1 certification, I encountered an issue where the page stalled and got stuck after clicking the 'submit exam' button, effectively breaking the exam system.
Despite searching online for solutions and submitting a help ticket, I was informed that the issue could not be replicated, and the ticket was closed. After several days of studying with a broken exam system, I managed to identify a workaround and replicate the error, but this took valuable time away from my proper study schedule."

# Coding Challenges: Intro Apex
- [CalculatorHelper.cls](/force-app/main/default/classes/CalculatorHelper.cls)
- [CalculatorController.cls](/force-app/main/default/classes/CalculatorController.cls)
- [CalculatorPage.Page](/force-app/main/default/pages/Calculator.page)
- [CalculatorControllerTests.cls](/force-app/main/default/classes/CalculatorControllerTests.cls)

## Challenge I
Create a class called Calculator with a single method called Add. This method should take 2 Integer parameters and return their sum.
- [CalculatorHelper.Add()](/force-app/main/default/classes/CalculatorHelper.cls)

## Challenge II
Create a method called Multiply that takes 2 Integer parameters and returns their product. You are not allowed to use the * operator to multiply the two Integers, and you must use your Add method you created in Challenge I.
- [CalculatorHelper.Multiply()](/force-app/main/default/classes/CalculatorHelper.cls)

## Challenge III
Create a method called Divide that takes 2 Integer parameters and returns their quotient (Parameter 1 / Parameter 2). Once again, you are not allowed to use the / operator, and you must use your Add method. For this challenge, do not consider if zero is the divisor.
- [CalculatorHelper.Divide()](/force-app/main/default/classes/CalculatorHelper.cls)

## Challenge IV
Modify your Divide method so that it will return 0 if zero is the divisor.
- [CalculatorHelper.Divide()](/force-app/main/default/classes/CalculatorHelper.cls)

## Challenge V
Create a method called Mod that takes 2 Integer parameters and returns their remainder. You are not allowed to use the Math.Mod() method.
- [CalculatorHelper.Mod()](/force-app/main/default/classes/CalculatorHelper.cls)

## Elite Challenge I
Create a method called Calculate that takes in a String in proper mathematical format (eg. 1 + 1) and returns the result.
Test Cases<br>
1 + 2 * 3 = 7<br>
2 * 2 + 3 = 7<br>
(1 + 2) * 3 = 9<br>
((3 * (4 + 2) - 8) + 10) / 2 = 10<br>
(10.5 * 2 - 10) * 0.5 = 5.5<br>
- [CalculatorHelper.Calculate()](/force-app/main/default/classes/CalculatorHelper.cls)



# Coding Challenges: DML and SOQL
SOQL, SOSL and DML
These challenges should be done in a Trailhead Playground, not a Scratch Org! That way, you have records to work with.
- [DataLordHelper.cls](/force-app/main/default/classes/DataLordHelper.cls)
- [DataLordController.cls](/force-app/main/default/classes/DataLordController.cls)
- [DataLord/page](/force-app/main/default/classes/DataLord.page)

## SOQL
All these challenges can be completed in a single line using a cleverly structured SOQL query. Take the extra challenge to come up with the solution that uses the lowest number of lines of code!

### Challenge I
Write a class called DataLord that has 1 method called NumAccounts. This method should return the number of Accounts that exist in org
- [DataLordHelper.NumAccounts()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge II
Write a method called NumHot. This method should return the number of Accounts with a Rating of Hot
- [DataLordHelper.NumHot()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge III
Write a method called NumComplex. This method should return the number of Accounts that have an ampersand (&) in the Name
- [DataLordHelper.NumComplex()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge IV
Write a method called BigFive. This method should return the top 5 Accounts in terms of Annual Revenue. You may only use 1 line of code for the method body
- [DataLordHelper.BigFive()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge V
Write a method called LastBigOpportunity. This method should return the Opportunity with the most recent Close Date that had an Amount over $100,000.
- [DataLordHelper.LastBigOpportunity()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge VI
Write a method called MajorPlayers. This method should return all Contacts that are associated to an Account with a Rating of Hot.
- [DataLordHelper.MajorPlayers()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge VII
Write a method called MostPopularAccount. This method should return the Account Name that has the most associated Contacts.
- [DataLordHelper.MostPopularAccount()](/force-app/main/default/classes/DataLordHelper.cls)

### Elite Challenge I
Universal Containers is interested in knowing the top 5 Lead Sources that are most likely to close and how likely those Sources are to close. They also wish to ignore the case where the Lead Source is blank. Write a single SOQL query to retrieve this information.

## SOSL

### Challenge I
Write a method to retrieve all Contacts and Leads that are named Tom.
- [DataLordHelper.getToms()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge II
Write a method to retrieve all Accounts that have an 'a' and an 'o' in one of their fields.
- [DataLordHelper.getAOAccounts()](/force-app/main/default/classes/DataLordHelper.cls)

### Elite Challenge I
Robin knows that there is a phone number that ends in 1000, but has no idea which field it is in. They know it is either on an Account, Contact, or Lead and just need the Name. Write a method that solves Robin's issue.
- [DataLordHelper.findRecordsWithPhoneNumber1000()](/force-app/main/default/classes/DataLordHelper.cls)

## DML

### Challenge I
Write a method called SpawnContacts that creates and inserts 200 uniquely named Contacts into the database.
- [DataLordHelper.spawnContacts()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge II
Write a method called CreateHomes that creates and inserts 3 uniquely named Accounts into the database.
- [DataLordHelper.createHomes()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge III
Write a method called Relocate that deletes the 50 most recent Contacts in the database.
- [DataLordHelper.relocate()](/force-app/main/default/classes/DataLordHelper.cls)
### Challenge IV
Write a method called AssignHomes that relates the all Contacts created in these challenges to the 3 Accounts randomly.
Note: This should only assign Contacts created during this challenge, and should ignore all Contacts created otherwise.
- [DataLordHelper.assignHomes()](/force-app/main/default/classes/DataLordHelper.cls)

### Elite Challenge I
Write a method called Play. This method should set a savepoint and rollback to the savepoint just before ending. It should then call all 4 methods in prior DML challenges then, before rolling back, print to the Debug Log some statistics about the state of the Database. Include: Number of Contacts and Accounts at the start, Number of Contacts and Accounts currently, and the number of Related Contacts for each Account.
### Master Challenge
Create a class called PlaygroundSetup. It should have a method called Setup that creates starting data using the following rules:
Setup should accept a parameter of type Integer
This parameter represents the number of Accounts and Leads to create
This parameter, divided by 2, represents the number of Products to create.
Each Account should have:
a unique Name
a random Annual Revenue between $10,000 and $3,000,000
a Rating based on their Annual Revenue:
Cold: Annual Revenue < $75,000
Warm: $75,000 < Annual Revenue < $750,000
Hot: $750,000 < Annual Revenue
a random number of Contacts (between 0-4)
Each Contact should have:
a random Name (use a premade list of First and Last names to pull from)
an Email Address in the form LastNameFirstName@AccountName.com
Each Lead should have:
a random Name (same as Contacts)
a random Company Name that matches an Account Name we created
an Email Address in the same format as the Contacts
Each Product should have:
a random Price in the Standard Pricebook
a Name
a unique Product Code
Use multiple helper methods in order to logically sort your code. No matter how many records are created, your solution should use the same number of DML statements and SOQL queries.
Note: Your org has limited data storage. Don't try doing this with too many records at once! Stick to low values, like 10-20.


## Coding Challenges: OOP
Pillars of Object Oriented Programming

### Challenge I
Create a class called Vehicle. The Vehicle class should have the following:
An enum publicly available called Medium with the values LAND, AIR, WATER
A property called Speed. This should be read-only outside of the class. This is not allowed to be negative
A property called Name. This should be read-only outside of the class
A property called Occupants. This is not allowed to be negative
A constant called Capacity. This must be at least 1
A variable called Media, which is a list of Mediums. This should only be accessible by the class and any of its children
- [Vehicle.cls](/force-app/main/default/classes/Vehicle.cls)
### Challenge II
Add the following methods to Vehicle:
A constructor that sets Speed, Occupants, Name, and Capacity to default values
A method called Accelerate which changes Speed by the specified amount
An abstract method called Turn
A method called ToString that prints out the current Speed, all Media, the Name, and the number of Occupants
- [Vehicle.cls](/force-app/main/default/classes/Vehicle.cls)
### Challenge III
Create a class called Car that extends Vehicle. Car should have the following:
A variable called SteeringRotation. This should not be accessible outside of the class. It must be between -1440 and 1440, inclusive
A property called TireRotation. This should be read-only outside of the class. It must be between -90 and 90, inclusive
A property called Gear. This should be read-only outside of the class
A constructor that calls the base constructor of Vehicle and then sets the two rotation values to 0 and adds the LAND Medium to Media
Implement Turn to rotate the SteeringRotation by the specified amount, in degrees, and the TireRotate by 1/16th the specified amount, in degrees.
- [Car.cls](/force-app/main/default/classes/Car.cls)
### Challenge IV
Make the following modifications to Vehicle:
Implement constructor chaining to allow for values set by the constructor to be input instead
Make the following modifications to Car:
Implement constructor chaining to allow inputs for values that Vehicle's constructor sets
Override the Accelerate function to call the base implementation, and then set the Gear via the following equation: Gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(Speed)))
- [Vehicle.cls](/force-app/main/default/classes/Vehicle.cls)
- [Car.cls](/force-app/main/default/classes/Car.cls)

## Coding Challenges: Triggers

### Challenge I
Create a trigger to prevent the deletion of Accounts with Contacts.
- [AccountTriggerHelper.cls](/force-app/main/default/classes/AccountTriggerHelper.cls)
### Challenge II
Create a trigger to set a default value for Email on Contacts that are inserted without one.
- [ContactTriggerHelper.cls](/force-app/main/default/classes/AccountTriggerHelper.cls)
### Challenge III
Create a trigger to create a new related Contact when an Account is inserted.
- [AccountTriggerHelper.cls](/force-app/main/default/classes/AccountTriggerHelper.cls)
### Challenge IV
Create a trigger to update the phone field of the related Account when a Contact's phone field is updated. The Account and Contact should end up having the same value in their phone fields.
- [ContactTriggerHelper.cls](/force-app/main/default/classes/AccountTriggerHelper.cls)
### Create Test Class
- [ContactTriggerHelperTests.cls](/force-app/main/default/classes/AccountTriggerHelperTest.cls)

### Elite Challenge I
Universal Containers has recently had some issues with Contacts being inserted with duplicate phone numbers by accident. A developer has recently cleaned all Contacts from having duplicate phone numbers, but they want you to make sure this doesn't happen in the future. Use a trigger to solve the above problem.
### Elite Challenge II
Universal Containers has recently had some issues with Cases that they need solving. Their first issue is that Cases are being created with their Status not set to New. All new Cases should have New as their Status. Their second issue is that support representatives are forgetting to change the Status to Working, but are adding in Internal Comments. Make sure that whenever the Internal Comments are updated, the Status is also changed to Working if it's New.
### Elite Challenge III
Universal Containers always uses the Installation: Portable Product for all of their Orders. Make it so that this Product is automatically added to a new Order if it's not already there.

# Coding Challenges:Batch
## Challenge: 
Create batchable apex that will delete stale Account records. 
Stale account records are Accounts with no related open opportunities for the last 6 months. 
Create schedulable apex that will execute the batch class above. 
Schedule your schedulable apex to run at 12 am at the first of every month. 
Take a screenshot of your scheduled job from within the setup menu and include it in the repo 
- [AccountBatchDeleteStale.cls](/force-app/main/default/classes/AccountBatchDeleteStale.cls)
- [AccountSchedulableDeleteStale.cls](/force-app/main/default/classes/AccountSchedulableDeleteStale.cls)

# Coding Challenges: Visualforce
Visualforce Challenges
## Challenge I
Create a Visualforce page that displays a single Account, specified as a parameter in the URL.
- [AccountDetail.page](/force-app/main/default/pages/AccountDetail.page)

## Challenge II
Modify your Visualforce page to display a paginated table of Accounts.
- [AccountDetailPagination.page](/force-app/main/default/pages/AccountDetailPagination.page)
- [AccountDetailPaginationController.cls](/force-app/main/default/classes/AccountDetailPaginationController.cls)

## Challenge III
Modify your Visualforce page to display a single Account, but this time the Account should always be the same, regardless of the parameter in the URL. You may not use a Standard Controller.
- [AccountDetailSpecific.page](/force-app/main/default/pages/AccountDetailSpecific.page)
- [AccountDetailSpecificController.cls](/force-app/main/default/classes/AccountDetailSpecificController.cls)

## Challenge IV
Add to your Visualforce page an About Me section. This should simply be a paragraph about yourself. However, this paragraph should be translated to Spanish if the current viewing user has their language set to Spanish. Download this creation as a PDF.
- [AccountDetailSpecific.page](/force-app/main/default/pages/AccountDetailSpecific.page)
- [AccountDetailSpecificController.cls](/force-app/main/default/classes/AccountDetailSpecificController.cls)

## Challenge V
Style your wondrous Visualforce creation with CSS.
- [AccountDetailSpecific.page](/force-app/main/default/pages/AccountDetailSpecific.page)
- [AccountDetailSpecificController.cls](/force-app/main/default/classes/AccountDetailSpecificController.cls)
- [CustomStyles.resource](/force-app/main/default/pages//staticresources/CustomStyles/CustomStyles.resource)
- [styles.css](/force-app/main/default/pages//staticresources/CustomStyles/styles.css)


## Challenge VI
Add functionality to your Visualforce page to add a greeting to the page. This greeting should include the Name of the Account specified as a parameter in the URL, and should only display once you click a button.
- [AccountDetailSpecific.page](/force-app/main/default/pages/AccountDetailSpecific.page)
- [AccountDetailSpecificController.cls](/force-app/main/default/classes/AccountDetailSpecificController.cls)

## Challenge VII
Create a Visualforce page that displays an Account based off of user input.
- [AccountDetailInput.page](/force-app/main/default/pages/AccountDetailInput.page)
- [AccountDetailInputController.cls](/force-app/main/default/classes/AccountDetailInputController.cls)

## Challenge VIII
Add to your Visualforce page the functionality to display all related Contacts of the Account as an unformatted list of names.
- [AccountDetailInput.page](/force-app/main/default/pages/AccountDetailInput.page)
- [AccountDetailInputController.cls](/force-app/main/default/classes/AccountDetailInputController.cls)

## Challenge IX
Create a Visualforce page that displays all Accounts in the system and all their related Contact Names in the same table. The Contact names should be separated by a comma and a space.
- [AccountContact.page](/force-app/main/default/pages/AccountContact.page)
- [AccountContactController.cls](/force-app/main/default/classes/AccountContactController.cls)

## Challenge X
Create a second Visualforce page that takes in some user input to filter Accounts by. Once this input is submitted, your page should display the previous Visualforce page you made and use the filter to filter the list of all Accounts.
- [AccountContact.page](/force-app/main/default/pages/AccountContact.page)
- [AccountContactController.cls](/force-app/main/default/classes/AccountContactController.cls)
- [AccountFilter.page](/force-app/main/default/pages/AccountFilter.page)

## Challenge XI
On your Visualforce page with all Accounts, implement a search feature. This feature should update the list of all Accounts with each character typed.
- [AccountContact.page](/force-app/main/default/pages/AccountContact.page)
- [AccountContactController.cls](/force-app/main/default/classes/AccountContactController.cls)

## Challenge XII
Modify your table to support inline editing.
- [AccountContactSearch.page](/force-app/main/default/pages/AccountContactSearch.page)
- [AccountContactSearchController.cls](/force-app/main/default/classes/AccountContactSearchController.cls)

## Challenge XIII
In your Visualforce page created in Challenge VII, modify your page to only display the Account and Contact information when an Account has been input.
Hint
Use the .childComponents.add() method!
- [AccountContactSearch.page](/force-app/main/default/pages/AccountContactSearch.page)
- [AccountContactSearchController.cls](/force-app/main/default/classes/AccountContactSearchtController.cls)

## Challenge XIV
Make use of the transient keyword and other optimizations to improve the performance of your 2 page Visualforce creation without changing any of the functionality.
- [AccountContactSearch.page](/force-app/main/default/pages/AccountContactSearch.page)
- [AccountContactSearchController.cls](/force-app/main/default/classes/AccountContactSearchtController.cls)
- [AccountContactSearchFilter.page](/force-app/main/default/pages/AccountContactSearchFilter.page)

## Challenge XV
Write comprehensive tests for your 2 page Visualforce creation.
- [AccountContactSearchController.cls](/force-app/main/default/classes/AccountContactSearchtController.cls)
- [AccountContactSearchControllerTests.cls](/force-app/main/default/classes/AccountContactSearchtControllerTests.cls)

## Elite Challenge I
Create a Visualforce page that shows a Wikipedia page of your choice. This should have a header that describes the page, a preview of the page, and a short description of what you like about the page/what you learned. You are not allowed to use any image components or tags to display the page preview and it should not be interactive.

## Elite Challenge II
Create a Visualforce page that displays information about Contacts related to an Account passed as a parameter to the page. Display this Visualforce page on all Account record pages.


# Aura Challenge
Create two Aura components, one child and one parent, that showcases your ability to create component communication. 
The child component should contain a text input box and a button. When the user clicks the button, the input text should be passed to the parent component. 
The parent component receives messages from the child and prints them out in a list. 
We should have a button on the parent that calls a function in our child component - this function should clear the value of our input box.
- [ChildComponent](/force-app/main/default/aura/ChildComponent/)
- [ParentComponent](/force-app/main/default/aura/ParentComponent/)
- [MessageEvent](/force-app/main/default/aura/MessageEvent/)

# LWC Challenge:
## Wire Service Only
Create a LWC that can accept user input and dynamically display account records where the account name is similar to the value of the text input. Use the wire service only. 
- [AccountListWithWire](/force-app/main/default/lwc/accountListWithWire/)
- [AccountListController.cls](/force-app/main/default/classes/AccountListController.cls)

## Imperative Apex
Next, recreate the same component but this time use imperative apex. 
- [AccountListWitApex](/force-app/main/default/lwc/accountListWithApex/)
- [AccountListController.cls](/force-app/main/default/classes/AccountListController.cls)

# Deployment/UI Challenge 6/26
Create a custom object called 'Class Delivery' 
It should have the following fields:
auto-number name field
lookup to contact with a label of 'Assigned Trainer' 
Make sure only 'Trainer' contacts may be selected - how you determine this is up to you
Put all of the metadata into an unlocked package and then send me the install link for the package. 

- [Class_Delivery__c](/force-app/main/default/objects/Class_Delivery__c/)

sf package create --name force-app --package-type Unlocked --path force-app
sf package version create --path force-app --installation-key-bypass --code-coverage -w 10
- [Class Delivery Package](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tbm0000001jntAAA)

sf package version promote --package

# JEST Challenge 7/1/24
 
Create a LWC that can:
Create a Contact record from a custom form (no OOB components like record-edit-form)
associate the new contact record with a pre-existing account 
Write a JEST testing suite for this component following all best practices. 
- [contactForm](/force-app/main/default/lwc/contactForm/)

# Data Loader Challenge 7/1/24
 
Use data loader to retrieve all Account records in your org with open opportunities with an amount greater than 50k. 
Use data loader to set the rating field on all these accouns to 'Hot'
you may need to create some dummy records to test this 
Post a loom video to screen capture the full clickpath 
- [Data Loader Walkthrough Link](https://www.loom.com/share/ea8a3ac3818348a8ac26b906f182fbee?sid=e9b02cab-5298-46dd-ac80-0604ca6c9556)
- [Data Loader Walkthrough video](/force-app/main/default/videos/DataLoaderWalkthrough.mp4)
