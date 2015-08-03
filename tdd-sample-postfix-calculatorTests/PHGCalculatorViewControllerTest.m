#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>
#import "PHGCalculatorViewController.h"

@interface PHGCalculatorViewControllerTest : XCTestCase
@end

@implementation PHGCalculatorViewControllerTest
PHGCalculatorViewController *calculatorViewController;

- (void)setUp {
    [super setUp];
    calculatorViewController = [[PHGCalculatorViewController alloc] initWithNibName:@"CalculatorView" bundle:nil];
    [calculatorViewController view];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testDisplayLabelShouldBeConnected {
    XCTAssertNotNil([calculatorViewController numberDisplay]);
}

- (void)testDisplayLabelInitializedToZero {
    XCTAssertEqualObjects(@"0", calculatorViewController.numberDisplay.text);
}

- (void)testPostfixCalculatorLoadedWithView {
    XCTAssertNotNil([calculatorViewController postfixCalculator]);
}

- (void)testSubviewsExistForEachNumberButton {
    XCTAssertTrue([self foundButtonWithTitle:@"1"], "Expected button titled 1");
    XCTAssertTrue([self foundButtonWithTitle:@"2"], "Expected button titled 2");
    XCTAssertTrue([self foundButtonWithTitle:@"3"], "Expected button titled 3");
    XCTAssertTrue([self foundButtonWithTitle:@"4"], "Expected button titled 4");
    XCTAssertTrue([self foundButtonWithTitle:@"5"], "Expected button titled 5");
    XCTAssertTrue([self foundButtonWithTitle:@"6"], "Expected button titled 6");
    XCTAssertTrue([self foundButtonWithTitle:@"7"], "Expected button titled 7");
    XCTAssertTrue([self foundButtonWithTitle:@"8"], "Expected button titled 8");
    XCTAssertTrue([self foundButtonWithTitle:@"9"], "Expected button titled 9");
    XCTAssertTrue([self foundButtonWithTitle:@"0"], "Expected button titled 0");
}

- (void)testSubviewForEnterButton {
    XCTAssertTrue([self foundButtonWithTitle:@"⏎"], "Expected button titled ⏎ (enter)");
}

- (void)testSubviewForTimesButton {
    XCTAssertTrue([self foundButtonWithTitle:@"×"], "Expected button titled ⏎ (enter)");
}

- (void)testNumberButtonsConnectedToAppendDisplayValue {
    [self assertNumberButtonActionSent:@"1"];
    [self assertNumberButtonActionSent:@"2"];
    [self assertNumberButtonActionSent:@"3"];
    [self assertNumberButtonActionSent:@"4"];
    [self assertNumberButtonActionSent:@"5"];
    [self assertNumberButtonActionSent:@"6"];
    [self assertNumberButtonActionSent:@"7"];
    [self assertNumberButtonActionSent:@"8"];
    [self assertNumberButtonActionSent:@"9"];
    [self assertNumberButtonActionSent:@"0"];
}

- (void)testAppendDigitHasNoLeadingZero {
    [self touchUpInsideButton:@"2"];
    [self touchUpInsideButton:@"0"];
    [self touchUpInsideButton:@"9"];
    XCTAssertEqualObjects(@"209", calculatorViewController.numberDisplay.text);
}

- (void)testEnterAddsValueToPostfixCalculator {
    PHGPostfixCalculator *mockPostfixCalculator = mock([PHGPostfixCalculator class]);
    calculatorViewController.postfixCalculator = mockPostfixCalculator;
    [self touchUpInsideButton:@"2"];
    [self touchUpInsideButton:@"1"];
    [self touchUpInsideButton:@"3"];
    [self touchUpInsideButton:@"⏎"];

    [verify(mockPostfixCalculator) append:@"213"];
}

- (void)testEnterAllowsSubsequentNumbersToBeAppended {
    PHGPostfixCalculator *mockPostfixCalculator = mock([PHGPostfixCalculator class]);
    calculatorViewController.postfixCalculator = mockPostfixCalculator;
    [self touchUpInsideButton:@"2"];
    [self touchUpInsideButton:@"⏎"];

    [self touchUpInsideButton:@"4"];
    [self touchUpInsideButton:@"⏎"];


    [verify(mockPostfixCalculator) append:@"2"];
    [verify(mockPostfixCalculator) append:@"4"];
}

- (void)testTimesButtonConnectedToOperate {

}

- (void)assertNumberButtonActionSent:(NSString *)buttonValue {
    [self touchUpInsideButton:buttonValue];
    NSString *lastDigit = [calculatorViewController.numberDisplay.text substringFromIndex:[calculatorViewController.numberDisplay.text length] - 1];
    XCTAssertEqualObjects(buttonValue, lastDigit);
}

- (void)touchUpInsideButton:(NSString *)buttonToSelect {
    NSArray *subviews = calculatorViewController.view.subviews;
    for (id subview in  subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            if ([[subview currentTitle] isEqualToString:buttonToSelect]) {
                [subview sendActionsForControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
}

- (BOOL)foundButtonWithTitle:(NSString *)expectedTitle {
    NSArray *subviews = calculatorViewController.view.subviews;
    for (id subview in  subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            if ([[subview currentTitle] isEqualToString:expectedTitle]) {
                return true;
            }
        }
    }
    return false;
}

@end