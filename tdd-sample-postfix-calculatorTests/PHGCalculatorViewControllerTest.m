#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#define MOCKITO_SHORTHAND

#import <OCMockito/OCMockito.h>
#import "PHGCalculatorViewController.h"

@interface PHGCalculatorViewControllerTest : XCTestCase
@end

@implementation PHGCalculatorViewControllerTest
PHGCalculatorViewController *calculatorViewController;
PHGPostfixCalculator *mockPostfixCalculator;

- (void)setUp {
    [super setUp];
    calculatorViewController = [[PHGCalculatorViewController alloc] initWithNibName:@"CalculatorView" bundle:nil];
    [calculatorViewController view];
    mockPostfixCalculator = mock([PHGPostfixCalculator class]);
    XCTAssertNotNil([calculatorViewController postfixCalculator]);
    calculatorViewController.postfixCalculator = mockPostfixCalculator;
}

- (void)tearDown {
    calculatorViewController = nil;
    [super tearDown];
}

- (void)testSubview_EnterButton {
    XCTAssertTrue([self foundButtonWithTitle:@"⏎"], "Expected button titled ⏎ (enter)");
}

- (void)testSubview_MultiplyButton {
    XCTAssertTrue([self foundButtonWithTitle:@"×"], "Expected button titled ×");
}

- (void)testSubview_SubtractButton {
    XCTAssertTrue([self foundButtonWithTitle:@"−"], "Expected button titled −");
}
- (void)testSubview_AddButton {
    XCTAssertTrue([self foundButtonWithTitle:@"+"], "Expected button titled −");
}

- (void)testSubview_AllClearButton {
    XCTAssertTrue([self foundButtonWithTitle:@"AC"], "Expected button titled AC");
}

- (void)testSubviews_NumberButtons {
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

- (void)testConnectionOfLabel_NumberDisplay {
    XCTAssertNotNil([calculatorViewController numberDisplay]);
}

- (void)testConnectionOfButtons_Numbers {
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

- (void)testConnectionOfButton_Enter {
    calculatorViewController.numberDisplay.text = @"7";
    [self touchUpInsideButton:@"⏎"];
    [verify(mockPostfixCalculator) append:@"7"];
}

- (void)testConnectionOfButton_Multiply {
    [self touchUpInsideButton:@"×"];
    [verify(mockPostfixCalculator) multiply];
}

- (void)testConnectionOfButton_Subtract {
    [self touchUpInsideButton:@"−"];
    [verify(mockPostfixCalculator) subtract];
}

- (void)testConnectionOfButton_AllClear {
    [self touchUpInsideButton:@"AC"];
    [verify(mockPostfixCalculator) allClear];
}

- (void)testInitializationOfLabel_DisplayToZero {
    XCTAssertEqualObjects(@"0", calculatorViewController.numberDisplay.text);
}

- (void)testAllClear_ResetsDisplay {
    calculatorViewController.numberDisplay.text = @"7";
    [calculatorViewController enter];
    [self touchUpInsideButton:@"AC"];

    XCTAssertEqualObjects(@"0", calculatorViewController.numberDisplay.text);
}


- (void)testAllClear_AllowsNumbersToBeEnteredWithNoLeadingZero {
    [self touchUpInsideButton:@"3"];
    [self touchUpInsideButton:@"AC"];
    [self touchUpInsideButton:@"5"];

    XCTAssertEqualObjects(@"5", calculatorViewController.numberDisplay.text);
}

- (void)testNumberDisplay_HasNoLeadingZeroWhenNumberButtonSelected {
    [self touchUpInsideButton:@"2"];
    XCTAssertEqualObjects(@"2", calculatorViewController.numberDisplay.text);
}

- (void)testEnter_AppendsNumbers {
    [self touchUpInsideButton:@"2"];
    [calculatorViewController enter];

    [self touchUpInsideButton:@"4"];
    [calculatorViewController enter];

    [verify(mockPostfixCalculator) append:@"2"];
    [verify(mockPostfixCalculator) append:@"4"];
}

- (void)testDoMultiplication_ShowsProductInNumberDisplay {
    [given([mockPostfixCalculator multiply]) willReturn:@"612"];

    [calculatorViewController doMultiplication];

    XCTAssertEqualObjects(@"612", calculatorViewController.numberDisplay.text);
    [verify(mockPostfixCalculator) multiply];
}

- (void)testDoMultiplication_AppendsNumberAndAllowsUsersToEnterMoreNumbers {
    [given([mockPostfixCalculator multiply]) willReturn:@"anything"];
    [self touchUpInsideButton:@"9"];
    [self touchUpInsideButton:@"1"];
    [calculatorViewController doMultiplication];
    [self touchUpInsideButton:@"7"];

    [verify(mockPostfixCalculator) append:@"91"];
    XCTAssertEqualObjects(@"7", calculatorViewController.numberDisplay.text);
}

- (void)testDoSubtraction_ShowsDifferenceInNumberDisplay {
    [given([mockPostfixCalculator subtract]) willReturn:@"333"];

    [calculatorViewController doSubtraction];

    XCTAssertEqualObjects(@"333", calculatorViewController.numberDisplay.text);
    [verify(mockPostfixCalculator) subtract];
}

- (void)testDoSubtraction_AppendsNumberAndAllowsUsersToEnterMoreNumbers {
    [given([mockPostfixCalculator subtract]) willReturn:@"anything"];
    [self touchUpInsideButton:@"1"];
    [calculatorViewController doSubtraction];
    [self touchUpInsideButton:@"8"];

    [verify(mockPostfixCalculator) append:@"1"];
    XCTAssertEqualObjects(@"8", calculatorViewController.numberDisplay.text);
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