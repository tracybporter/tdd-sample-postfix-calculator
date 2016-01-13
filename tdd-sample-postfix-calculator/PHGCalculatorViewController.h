#import <UIKit/UIKit.h>
#import "PHGPostfixCalculator.h"

@interface PHGCalculatorViewController : UIViewController
@property(strong, nonatomic) IBOutlet UILabel *numberDisplay;
@property(strong, nonatomic) PHGPostfixCalculator *postfixCalculator;
@property(readonly) BOOL userIsEnteringANumber;

- (IBAction)enter;

- (IBAction)doAddition;

- (IBAction)doDivision;

- (IBAction)doMultiplication;

- (IBAction)doSubtraction;
@end
