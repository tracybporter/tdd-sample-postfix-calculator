#import "PHGBaseFnTest.h"

@interface BasicUiFntest : PHGBaseFnTest
@end

@implementation BasicUiFntest
- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAllNumberButtonsWork {
    [tester tapViewWithAccessibilityLabel:@"One"];
    [tester tapViewWithAccessibilityLabel:@"Three"];
    [tester tapViewWithAccessibilityLabel:@"Five"];
    [tester tapViewWithAccessibilityLabel:@"Seven"];
    [tester tapViewWithAccessibilityLabel:@"Nine"];
    [tester tapViewWithAccessibilityLabel:@"Zero"];
    [tester tapViewWithAccessibilityLabel:@"Two"];
    [tester tapViewWithAccessibilityLabel:@"Four"];
    [tester tapViewWithAccessibilityLabel:@"Six"];
    [tester tapViewWithAccessibilityLabel:@"Eight"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    XCTAssertEqualObjects(@"13579024681", [self retrieveDisplayValue]);
}

@end
