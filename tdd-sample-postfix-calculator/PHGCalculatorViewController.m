#import "PHGCalculatorViewController.h"

@implementation PHGCalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postfixCalculator = [[PHGPostfixCalculator alloc] init];
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

- (IBAction)manageUserEntry:(NSString *(^)(void))doTheMath {
    if (_userIsEnteringANumber) {
        [self enter];
    }
    self.numberDisplay.text = doTheMath();
}

- (IBAction)doAddition {
    [self manageUserEntry:^{
        return [self.postfixCalculator add];
    }];
}

- (IBAction)doDivision {

    @try {
        [self manageUserEntry:^{
            return [self.postfixCalculator divide];
        }];
    }
    @catch (NSException *ex) {
        [self doAllClear];
        self.numberDisplay.text = @"Undefined";
    }

}

- (IBAction)doSubtraction {
    [self manageUserEntry:^{
        return [self.postfixCalculator subtract];
    }];
}

- (IBAction)doMultiplication {
    [self manageUserEntry:^{
        return [self.postfixCalculator multiply];
    }];
}

@end
