#import <UIKit/UIKit.h>
#import "PHGPostfixCalculator.h"

@interface PHGCalculatorViewController : UIViewController
@property(weak, nonatomic) IBOutlet UILabel *numberDisplay;
@property(strong, nonatomic) PHGPostfixCalculator *postfixCalculator;
@property(readonly) BOOL userIsEnteringANumber;

- (IBAction)enter;

- (IBAction)doMultiplication;

- (IBAction)doSubtraction;
@end
