#import <KIF/KIF.h>

@interface MultiplicationFnTest : KIFTestCase

@end

@implementation MultiplicationFnTest

- (void)setUp {
    [super setUp];
    [tester tapViewWithAccessibilityLabel:@"AllClear"];
    XCTAssertEqualObjects(@"0", [self retrieveDisplayValue]);
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

    XCTAssertEqualObjects(@"13579024681",  [self retrieveDisplayValue]);
}

- (void)testCalculateProductOf_71_and_396 {
    [tester tapViewWithAccessibilityLabel:@"Seven"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Three"];
    [tester tapViewWithAccessibilityLabel:@"Nine"];
    [tester tapViewWithAccessibilityLabel:@"Six"];

    [tester tapViewWithAccessibilityLabel:@"Multiply"];

    XCTAssertEqualObjects(@"28116.000000", [self retrieveDisplayValue]);
}

- (void)testZeroTimesAnythingIsStillZero {
    [tester tapViewWithAccessibilityLabel:@"Zero"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Two"];
    [tester tapViewWithAccessibilityLabel:@"Five"];

    [tester tapViewWithAccessibilityLabel:@"Multiply"];

    XCTAssertEqualObjects(@"0.000000", [self retrieveDisplayValue]);
}

- (NSString *)retrieveDisplayValue {
    return [(UILabel *) [tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"] text];
}


@end
