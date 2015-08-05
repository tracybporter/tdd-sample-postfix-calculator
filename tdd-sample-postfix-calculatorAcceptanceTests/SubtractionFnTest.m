#import <KIF/KIF.h>

@interface SubtractionFnTest : KIFTestCase

@end

@implementation SubtractionFnTest

- (void)setUp {
    [super setUp];
    [tester tapViewWithAccessibilityLabel:@"AllClear"];
    XCTAssertEqualObjects(@"0", [self retrieveDisplayValue]);
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

- (NSString *)retrieveDisplayValue {
    return [(UILabel *) [tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"] text];
}

@end
