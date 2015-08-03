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

- (void)testSubviewsExistForEachNumber {
    XCTAssertTrue([self foundButtonWithTitle:@"1"],"Expected button titled 1");
    XCTAssertTrue([self foundButtonWithTitle:@"4"],"Expected button titled 4");
    XCTAssertTrue([self foundButtonWithTitle:@"7"],"Expected button titled 7");
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