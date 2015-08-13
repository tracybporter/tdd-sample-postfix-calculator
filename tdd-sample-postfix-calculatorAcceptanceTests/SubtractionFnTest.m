#import "PHGBaseFnTest.h"

@interface SubtractionFnTest : PHGBaseFnTest

@end

@implementation SubtractionFnTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test71_minus_396 {
    [tester tapViewWithAccessibilityLabel:@"Seven"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Three"];
    [tester tapViewWithAccessibilityLabel:@"Nine"];
    [tester tapViewWithAccessibilityLabel:@"Six"];

    [tester tapViewWithAccessibilityLabel:@"Subtract"];

    XCTAssertEqualObjects(@"-325.000000", [self retrieveDisplayValue]);
}

- (void)testSingleNumberHandledCorrectly {
    [tester tapViewWithAccessibilityLabel:@"Eight"];
    [tester tapViewWithAccessibilityLabel:@"Seven"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];
    XCTAssertEqualObjects(@"87", [self retrieveDisplayValue]);

    [tester tapViewWithAccessibilityLabel:@"Subtract"];
    XCTAssertEqualObjects(@"87", [self retrieveDisplayValue]);
}

@end
