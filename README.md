# Overview
This is my first objective-c application. It is a simple and incomplete implementation focused on understanding what it takes to TDD an iOS application.
# Epics and Stories
## A. Epic: Walking Skeleton - Complete
1. When only one number in list, selecting multiply results in no calculation or error.
1. Clear all button resets the list of numbers.
1. Domain class provides product for last 2 numbers in a list.
1. Domain class does subtraction on the last 2 numbers in a list. The last number subtracted from the first.
1. Display a basic calculator with a result field at the top and number buttons in a grid.
1. Values are appended to a list by selecting number buttons and then enter.
1. Display the calculated product of two integers.
1. Display the product of more than two numbers by repeatedly selecting the multiplication button.
1. Display the difference of two numbers
1. Entering three numbers and selecting multiply and then subtraction results in correct calculation.
1. When only one number in list, selecting subtraction results in no calculation or error.
    
## B. Epic: Learn about app store deployment
1. Awaiting implementation
    1. Make the application version available in a programatic way
    1. Create a CI environment
    1. Application deployable to CI environment manually
    1. Tests run in the CI environment simulating iOS x
    1. Deploy application to own phone
    1. Release the application as alpha
    1. Deploy application to app store
1. Completed
    1. Tests run at the command line.
        1. `xcodebuild test -workspace tdd-sample-postfix-calculator.xcworkspace -scheme tdd-sample-postfix-calculator -destination 'platform=iOS Simulator,name=iPhone 5s'`

## C. Epic: Addition and Division and Negative Sign
## M. Epic: Make it pretty


# Setup
1. Git
1. Ruby (rvm, ruby)
1. Install Cocoapod gem
1. Clone the repository
1. `pod install`
1. Open xcode or appcode
1. Run all tests
1. Run the app in the simulator. I usually pick an iphone.

