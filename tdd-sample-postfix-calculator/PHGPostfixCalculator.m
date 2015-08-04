#import "PHGPostfixCalculator.h"


@implementation PHGPostfixCalculator

- (id)init {
    [self allClear];
    return self;
}


- (void)append:(NSString *)aNumberValue {
    [self.valueStack addObject:aNumberValue];
}

- (NSString *)multiply {
    if (self.valueStack.count > 1) {
        NSString *last = [self popStack];
        NSString *nextToLast = [self popStack];

        [self append:[NSString stringWithFormat:@"%f", last.doubleValue * nextToLast.doubleValue]];
    }
    return self.valueStack.lastObject;
}

- (NSString *)subtract {
    if (self.valueStack.count >1){
    NSString *subtrahend = [self popStack];
        NSString *minuend = [self popStack];

        [self append:[NSString stringWithFormat:@"%f", minuend.doubleValue - subtrahend.doubleValue]];
    }
    return self.valueStack.lastObject;
}

- (NSString *)popStack {
    NSString *lastOperand = self.valueStack.lastObject;
    [self.valueStack removeLastObject];
    return lastOperand;
}

- (void)allClear {
    self.valueStack = [NSMutableArray new];
}
@end