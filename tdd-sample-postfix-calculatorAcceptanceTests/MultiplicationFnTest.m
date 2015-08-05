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

- (void)test71_times_396 {
    [tester tapViewWithAccessibilityLabel:@"Seven"];
    [tester tapViewWithAccessibilityLabel:@"One"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];

    [tester tapViewWithAccessibilityLabel:@"Three"];
    [tester tapViewWithAccessibilityLabel:@"Nine"];
    [tester tapViewWithAccessibilityLabel:@"Six"];

    [tester tapViewWithAccessibilityLabel:@"Multiply"];

    XCTAssertEqualObjects(@"28116.000000", [self retrieveDisplayValue]);
}

-(void) testSingleNumberHandledCorrectly {
    [tester tapViewWithAccessibilityLabel:@"Four"];
    [tester tapViewWithAccessibilityLabel:@"Seven"];

    [tester tapViewWithAccessibilityLabel:@"Enter"];
    [tester tapViewWithAccessibilityLabel:@"Multiply"];

    XCTAssertEqualObjects(@"47", [self retrieveDisplayValue]);
}

- (NSString *)retrieveDisplayValue {
    return [(UILabel *) [tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"] text];
}

@end
