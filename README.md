#  MoneyMe Code Challenge Demo

This demo project is MoneyMe Code Challenge. This project featuring the new SwiftUI, and require Xcode 11 beta 4.

## Pre-requirements
* Xcode Version 11.0 beta 4 (11M374r) - it may not work with next new Xcode beta updates, as the APIs keep changing between beta versions
* macOS Catalina Version 10.15 Beta (19A512f) - it may not work with next macOS beta updates, as the APIs keep changing between beta versions

## Unit Testes
There are 2 Unit Test targets, most of the tests are in LogicText target
* MoneyMeCodeChallengeTests - require MoneyMeCodeChallenge host application
* LogicTest - require no host application

## Limitations and assumptions
There is no external User service, I'd tried to integrate Firebase into the project but failed. It takes too much effect to integrate into SwiftUI. 
The plan was to use the new Apple Login feature, but my Apple Developer Program is expired and can't use the Apple Login feature. 

## Known Bugs
There is an UI bug in LoanEditingView: After the second time triggered the LoanEditingView from LoanDetailView, the UIs are not updating when moving any of the slider value. It feels like it is a SwiftUI bug. 

## Some facts about Xcode 11 beta and Swift 5
### Pros
* Continually building features make TDD development easier. It result lesser time needed to wait for the Xcode to compile
* Live preview on SwiftUI
* SwiftUI and Combine framework make the code clean and lesser source code to write

### Cons
* It is very buggy
* it crashes a looooot
* it will not indicate the line correctly when something went wrong in the source code(SwiftUI codes), this will drive you crazy to debug it.
* Xcode beta is not backwards compatible, as the APIs keep changing. For example, Xcode beta 3 code will not build in Xcode beta 4, manually change of some APIs are required.
