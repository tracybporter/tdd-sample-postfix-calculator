#import <UIKit/UIKit.h>
#import "PHGPostfixCalculator.h"

@interface PHGCalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *numberDisplay;
@property (strong, nonatomic) PHGPostfixCalculator *postfixCalculator;
@end
