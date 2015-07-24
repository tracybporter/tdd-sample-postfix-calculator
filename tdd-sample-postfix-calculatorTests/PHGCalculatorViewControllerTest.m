#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PHGCalculatorViewController.h"

@interface PHGCalculatorViewControllerTest : XCTestCase
@end

@implementation PHGCalculatorViewControllerTest {
    PHGCalculatorViewController *calculatorViewController;
}
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

- (void)testDisplayLabelInitialziedToZero {
    XCTAssertEqualObjects(@"0", calculatorViewController.numberDisplay.text);
}

- (void)testPostfixCalculatorLoadedWithView {
    XCTAssertNotNil([calculatorViewController postfixCalculator]);
}

@end