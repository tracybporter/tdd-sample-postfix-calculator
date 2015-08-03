#import "PHGCalculatorViewController.h"
#import "PHGPostfixCalculator.h"

@implementation PHGCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfixCalculator = [[PHGPostfixCalculator alloc] init];
}

- (IBAction)appendDigitToDisplay:(UIButton *)sender {
    self.numberDisplay.text = [sender currentTitle];
}

@end
