#import "PHGBaseFnTest.h"

@implementation PHGBaseFnTest

- (void)setUp {
    [super setUp];
    [tester tapViewWithAccessibilityLabel:@"AllClear"];
    XCTAssertEqualObjects(@"0", [self retrieveDisplayValue]);
}

- (void)tearDown {
    [super tearDown];
}

- (NSString *)retrieveDisplayValue {
    return [(UILabel *) [tester waitForViewWithAccessibilityLabel:@"ResultsDisplay"] text];
}

@end
