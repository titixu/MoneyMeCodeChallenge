#  MoneyMe Code Challenge Demo

This demo project is MoneyMe Code Challenge

## Pre-requirements
* Xcode Version 11.0 beta 4 (11M374r)
* macOS Catalina Version 10.15 Beta (19A512f) - optional, Xcode Live preview functions only works in 10.15

## UITestes
There are 2 UITest targets
* MoneyMeCodeChallengeTests - require MoneyMeCodeChallenge host application
* LogicTest - require no host application

## Some facts about Xcode 11 beta and Swift 5
### Pros
* Continually building the app while changing the source code, this make TDD development eaisier. It result lesser time needed for TDD cycles
* Live preview on SwiftUI
* SwiftUI and Combine framework make the code clean and lesser source code to write

### Cons
* It is very buggy
* it crashes a looooot
* it will not indicate the line correctly when something went wrong in source code(SwiftUI codes) , this will drive you crazy to debug it.
* Xcode beta is not backward compatiable, as the APIs are keep changing. For examle Xcode beta 3 code will not build in Xcode beta 4, manually change of some APIs are required.
