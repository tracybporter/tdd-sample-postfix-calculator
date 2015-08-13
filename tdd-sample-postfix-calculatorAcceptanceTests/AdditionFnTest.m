#import "PHGBaseFnTest.h"

@interface AdditionFnTest : PHGBaseFnTest

@end

@implementation AdditionFnTest

- (void)test139_plus_5004 {
    [tester tapViewWithAccessibilityLabel:@"One"];
    [tester tapViewWithAccessibilityLabel:@"Three"];
    [tester tapViewWithAccessibilityLabel:@"Nine"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Five"];
    [tester tapViewWithAccessibilityLabel:@"Zero"];
    [tester tapViewWithAccessibilityLabel:@"Zero"];
    [tester tapViewWithAccessibilityLabel:@"Four"];

    [tester tapViewWithAccessibilityLabel:@"Add"];

    XCTAssertEqualObjects(@"-5143.000000", [self retrieveDisplayValue]);
}

- (void)testSingleNumberHandledCorrectly {
    [tester tapViewWithAccessibilityLabel:@"Six"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];
    XCTAssertEqualObjects(@"87", [self retrieveDisplayValue]);

    [tester tapViewWithAccessibilityLabel:@"Six"];
    XCTAssertEqualObjects(@"6", [self retrieveDisplayValue]);
}

@end
