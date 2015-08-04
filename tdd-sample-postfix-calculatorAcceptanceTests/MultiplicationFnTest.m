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

- (void)testDisplayShowsNumberWhenButtonsSelected {
    [tester tapViewWithAccessibilityLabel:@"One"];
    UILabel *displayLabel = (UILabel *)[tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"];
    XCTAssertEqualObjects(@"1", [displayLabel text]);
}

@end
