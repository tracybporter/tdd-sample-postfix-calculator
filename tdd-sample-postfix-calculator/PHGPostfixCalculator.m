#import "PHGPostfixCalculator.h"


@implementation PHGPostfixCalculator

- (id)init {
    [self allClear];
    return self;
}


- (void)append:(NSString *)aNumberValue {
    [self.valueStack addObject:aNumberValue];
}

- (NSString *)add {
    if (self.valueStack.count > 1) {
        [self append:[NSString stringWithFormat:@"%f", [self popStack] + [self popStack]]];
    }
    return self.valueStack.lastObject;
}

- (NSString *)multiply {
    if (self.valueStack.count > 1) {
        [self append:[NSString stringWithFormat:@"%f", [self popStack] * [self popStack]]];
    }
    return self.valueStack.lastObject;
}

- (NSString *)subtract {
    if (self.valueStack.count > 1) {
        [self append:[NSString stringWithFormat:@"%f", ((-1) * [self popStack]) + [self popStack]]];
    }
    return self.valueStack.lastObject;
}

- (double)popStack {
    NSString *lastOperand = self.valueStack.lastObject;
    [self.valueStack removeLastObject];
    return lastOperand.doubleValue;
}

- (void)allClear {
    self.valueStack = [NSMutableArray new];
}
@end