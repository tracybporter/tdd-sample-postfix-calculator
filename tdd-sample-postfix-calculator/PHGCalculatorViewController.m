#import "PHGCalculatorViewController.h"
#import "PHGPostfixCalculator.h"

@implementation PHGCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfixCalculator = [[PHGPostfixCalculator alloc] init];
}


@end
