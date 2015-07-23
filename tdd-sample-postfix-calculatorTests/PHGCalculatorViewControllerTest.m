#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PHGCalculatorViewController.h"

@interface PHGCalculatorViewControllerTest : XCTestCase
@end

@implementation PHGCalculatorViewControllerTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void) testDisplayLabelShouldBeConnected {
    PHGCalculatorViewController *calculatorViewController = [[PHGCalculatorViewController alloc]initWithNibName:@"CalculatorView" bundle:nil];
    [calculatorViewController view];
    XCTAssertNotNil([calculatorViewController numberDisplay]);
}

@end