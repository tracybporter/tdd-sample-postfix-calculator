#import "PHGCalculatorViewController.h"
#import "PHGPostfixCalculator.h"

@implementation PHGCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfixCalculator = [[PHGPostfixCalculator alloc] init];
    _userIsEnteringANumber = false;
}

- (IBAction)appendDigitToDisplay:(UIButton *)sender {
    if (_userIsEnteringANumber) {
        self.numberDisplay.text = [NSString stringWithFormat:@"%@%@", self.numberDisplay.text, sender.currentTitle];
    }
    else {
        self.numberDisplay.text = sender.currentTitle;
        _userIsEnteringANumber = true;
    }
}

@end
