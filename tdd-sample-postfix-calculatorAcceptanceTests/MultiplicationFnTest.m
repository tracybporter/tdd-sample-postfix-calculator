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

-(void) testMultiply2Numbers {
    [tester tapViewWithAccessibilityLabel:@"Two"];
    [tester tapViewWithAccessibilityLabel:@"Five"];
    [tester tapViewWithAccessibilityLabel:@"Multiply"];
    [tester tapViewWithAccessibilityLabel:@"Zero"];
    UILabel *resultsDisplay = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"];
    XCTAssertEqualObjects(@"0", [resultsDisplay text]);
}

@end
