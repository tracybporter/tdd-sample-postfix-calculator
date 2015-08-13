#import <Foundation/Foundation.h>


@interface PHGPostfixCalculator : NSObject
@property NSMutableArray *valueStack;

- (void)append:(NSString *)aNumberValue;

- (NSString *)add;

- (NSString *)multiply;

- (NSString *)subtract;

- (void)allClear;
@end