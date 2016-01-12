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
    return [self performOperation:^(double lastOnStack, double second) {
        return (lastOnStack + second);
    }];
}

- (NSString *)divide {
    if ([[self.valueStack lastObject] doubleValue] == 0) {
        NSException *myException = [NSException exceptionWithName:@"NSDecimalNumberDivideByZeroException" reason:@"Division by zero not allowed." userInfo:@""];
        @throw myException;
    }
    return [self performOperation:^(double lastOnStack, double previous) {
        return (previous / lastOnStack);
    }];
};

- (NSString *)multiply {
    return [self performOperation:^(double lastOnStack, double previous) {
        return (lastOnStack * previous);
    }];
}

- (NSString *)subtract {
    return [self performOperation:^(double lastOnStack, double previous) {
        return (previous - lastOnStack);
    }];
}

- (NSString *)performOperation:(double (^)(double, double))operate {
    if (self.valueStack.count > 1) {
        [self append:[NSString stringWithFormat:@"%f", operate([self popStack], [self popStack])]];
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