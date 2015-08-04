#import <KIF/KIF.h>

@interface MultiplicationFnTest : KIFTestCase

@end

@implementation MultiplicationFnTest

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

    UILabel *resultsDisplay = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"];

    XCTAssertEqualObjects(@"13579024681", [resultsDisplay text]);
}
-(void) testZeroTimesAnythingIsStillZero {
    [tester tapViewWithAccessibilityLabel:@"Zero"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Two"];
    [tester tapViewWithAccessibilityLabel:@"Five"];

    [tester tapViewWithAccessibilityLabel:@"Multiply"];

    UILabel *resultsDisplay = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"];
    XCTAssertEqualObjects(@"0.000000", [resultsDisplay text]);
}

@end
