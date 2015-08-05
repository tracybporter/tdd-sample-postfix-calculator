#import <KIF/KIF.h>

@interface BasicUiFntest : KIFTestCase

@end

@implementation BasicUiFntest
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

    XCTAssertEqualObjects(@"13579024681", [self retrieveDisplayValue]);
}

- (NSString *)retrieveDisplayValue {
    return [(UILabel *) [tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"] text];
}

@end
