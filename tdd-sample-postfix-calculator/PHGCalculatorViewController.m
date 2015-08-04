#import "PHGCalculatorViewController.h"
#import "PHGPostfixCalculator.h"

@implementation PHGCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfixCalculator = [[PHGPostfixCalculator alloc] init];
    _userIsEnteringANumber = false;
}

- (IBAction)doAllClear {
    [self.postfixCalculator allClear];
    _userIsEnteringANumber = false;
    self.numberDisplay.text = @"0";
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

- (IBAction)enter {
    [self.postfixCalculator append:self.numberDisplay.text];
    _userIsEnteringANumber = false;
}

- (IBAction)doMultiplication {
    if (_userIsEnteringANumber) {
        [self enter];
    }
    self.numberDisplay.text = [self.postfixCalculator multiply];
    _userIsEnteringANumber = false;
}

@end
