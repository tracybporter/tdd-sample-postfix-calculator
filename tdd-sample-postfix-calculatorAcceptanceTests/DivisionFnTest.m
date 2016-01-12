#import "PHGBaseFnTest.h"

@interface DivisionFnTest : PHGBaseFnTest

@end

@implementation DivisionFnTest

- (void)test61_dividedBy_Four {
    [tester tapViewWithAccessibilityLabel:@"Six"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Four"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Divide"];

    XCTAssertEqualObjects(@"15.250000", [self retrieveDisplayValue]);
}

- (void)testSingleNumberHandledCorrectly {
    [tester tapViewWithAccessibilityLabel:@"Three"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];
    [tester tapViewWithAccessibilityLabel:@"Divide"];

    XCTAssertEqualObjects(@"3", [self retrieveDisplayValue]);
}

- (void)test61_dividedBy_Zero {
    [tester tapViewWithAccessibilityLabel:@"Six"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Zero"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Divide"];

    XCTAssertEqualObjects(@"Undefined", [self retrieveDisplayValue]);
}

@end
