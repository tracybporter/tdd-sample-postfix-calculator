#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
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

- (void)testSubviewsExistForEachNumberButtons {
    XCTAssertTrue([self foundButtonWithTitle:@"1"]);
}

- (BOOL)foundButtonWithTitle:(NSString *)expectedTitle {
    NSArray *subviews = calculatorViewController.view.subviews;
    XCTAssertEqual(2, subviews.count);
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