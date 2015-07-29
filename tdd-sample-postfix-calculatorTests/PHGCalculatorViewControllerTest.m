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

- (void)testDisplayLabelInitializedToZero {
    XCTAssertEqualObjects(@"0", calculatorViewController.numberDisplay.text);
}

- (void)testPostfixCalculatorLoadedWithView {
    XCTAssertNotNil([calculatorViewController postfixCalculator]);
}

- (void)testSubviewsExistForNumberButtons {
    NSArray *subviews = calculatorViewController.view.subviews;
    bool buttonFound = false;
    for (id subview in  subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            if ([[subview currentTitle] isEqualToString:@"1"]) {
                buttonFound = true;
            }
        }
    }
    XCTAssertTrue(buttonFound);
    XCTAssertEqual(2, subviews.count);
}

@end