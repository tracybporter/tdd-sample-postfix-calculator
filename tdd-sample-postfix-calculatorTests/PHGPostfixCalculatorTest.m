#import <XCTest/XCTest.h>
#import "PHGPostfixCalculator.h"


@interface PHGPostfixCalculatorTest : XCTestCase
@property PHGPostfixCalculator *postfixCalculator;

@end

@implementation PHGPostfixCalculatorTest


- (void)setUp {
    [super setUp];
    self.postfixCalculator = PHGPostfixCalculator.new;
}

- (void)tearDown {
    [super tearDown];
}

- (void)testConstructedWithEmptyValueStack {
    XCTAssertNotNil(self.postfixCalculator.valueStack);
    XCTAssertEqual(0, self.postfixCalculator.valueStack.count);
}

- (void)testAppendsValueToStack {
    [self.postfixCalculator append:@"13"];
    XCTAssertEqual(1, self.postfixCalculator.valueStack.count);
    XCTAssertEqual(@"13", self.postfixCalculator.valueStack[0]);

    [self.postfixCalculator append:@"113"];
    XCTAssertEqual(2, self.postfixCalculator.valueStack.count);
    XCTAssertEqual(@"113", self.postfixCalculator.valueStack[1]);

    [self.postfixCalculator append:@"213"];
    XCTAssertEqual(3, self.postfixCalculator.valueStack.count);
    XCTAssertEqual(@"213", self.postfixCalculator.valueStack[2]);
}

- (void)testAdd_PositiveIntegersAndManipulatesStack {
    [self.postfixCalculator append:@"7"];
    [self.postfixCalculator append:@"9"];

    XCTAssertEqual(@"16".doubleValue, [[self.postfixCalculator add] doubleValue]);
    XCTAssertEqual(@"16".doubleValue, ((NSString *) self.postfixCalculator.valueStack.lastObject).doubleValue);
}

-(void)testAdd_SingleValueReturnsItself {
    [self.postfixCalculator append:@"-10"];
    XCTAssertEqualObjects(@"-10", [self.postfixCalculator add]);
}

-(void)testDivide_SingleValueReturnsItself {
    [self.postfixCalculator append:@"3007"];
    XCTAssertEqualObjects(@"3007", [self.postfixCalculator divide]);
}

- (void)testDivide_TwoNumbersAndManipulatesStack {
    [self.postfixCalculator append:@"-7.2"];
    [self.postfixCalculator append:@"2"];

    XCTAssertEqual(@"-3.6".doubleValue, [[self.postfixCalculator divide] doubleValue]);
    XCTAssertEqual(@"-3.6".doubleValue, ((NSString *) self.postfixCalculator.valueStack.lastObject).doubleValue);
}

- (void)testDivide_ByZeroThrowsException {
    [self.postfixCalculator append:@"999"];
    [self.postfixCalculator append:@"0"];

    XCTAssertThrowsSpecificNamed([self.postfixCalculator divide], NSException, NSDecimalNumberDivideByZeroException, @"should throw NSDecimalNumberDivideByZeroException");
}

- (void)testMultiplies_PositiveIntegersAndManipulatesStack {
    [self.postfixCalculator append:@"101"];
    [self.postfixCalculator append:@"5"];

    XCTAssertEqual(@"505".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
    XCTAssertEqual(@"505".doubleValue, ((NSString *) self.postfixCalculator.valueStack.lastObject).doubleValue);
}

- (void)testMultiplies_ConsecutivelyPositiveFractionalValues {
    [self.postfixCalculator append:@"101"];
    [self.postfixCalculator append:@"5"];
    [self.postfixCalculator append:@".1"];

    XCTAssertEqual(@"0.5".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
    XCTAssertEqual(@"50.5".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
}

- (void)testMultiplies_ConsecutivelyWithNegativeValues {
    [self.postfixCalculator append:@"-10"];
    [self.postfixCalculator append:@"3"];
    [self.postfixCalculator append:@"-.1"];

    XCTAssertEqual(@"-0.3".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
    XCTAssertEqual(@"3".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
}

-(void)testMultiplies_SingleValueReturnsItself {
    [self.postfixCalculator append:@"-10"];
    XCTAssertEqualObjects(@"-10", [self.postfixCalculator multiply]);
}

- (void)testSubtracts_PositiveIntegersAndManipulatesStack {
    [self.postfixCalculator append:@"11"];
    [self.postfixCalculator append:@"5"];

    XCTAssertEqual(@"6".doubleValue, [[self.postfixCalculator subtract] doubleValue]);
    XCTAssertEqual(@"6".doubleValue, ((NSString *) self.postfixCalculator.valueStack.lastObject).doubleValue);
    XCTAssertEqual(1, self.postfixCalculator.valueStack.count);
}

- (void)testSubtracts_ConsecutivelyWithDecimalValues {
    [self.postfixCalculator append:@"-10"];
    [self.postfixCalculator append:@"3"];
    [self.postfixCalculator append:@"-.1"];

    XCTAssertEqual(@"3.1".doubleValue, [[self.postfixCalculator subtract] doubleValue]);
    XCTAssertEqual(@"-13.1".doubleValue, [[self.postfixCalculator subtract] doubleValue]);
}

- (void)testSubtracts_NegativeValues {
    [self.postfixCalculator append:@"10"];
    [self.postfixCalculator append:@"-3"];

    XCTAssertEqual(@"13".doubleValue, [[self.postfixCalculator subtract] doubleValue]);
}

-(void)testSubtracts_SingleValueReturnsItself {
    [self.postfixCalculator append:@"7771"];
    XCTAssertEqualObjects(@"7771", [self.postfixCalculator subtract]);
}

- (void)testCombo_ConsecutiveOperations {
    [self.postfixCalculator append:@"-10"];
    [self.postfixCalculator append:@"-3"];
    [self.postfixCalculator append:@"-.1"];

    XCTAssertEqual(@"-2.9".doubleValue, [[self.postfixCalculator subtract] doubleValue]);
    XCTAssertEqual(@"29".doubleValue, [[self.postfixCalculator multiply] doubleValue]);
    XCTAssertEqual(1, self.postfixCalculator.valueStack.count);
}

-(void) testAllClear_resetsTheStack {
    XCTAssertEqual(0, self.postfixCalculator.valueStack.count);
    [self.postfixCalculator append:@"10"];
    [self.postfixCalculator append:@"3"];
    XCTAssertEqual(2, self.postfixCalculator.valueStack.count);

    [self.postfixCalculator allClear];
    XCTAssertEqual(0, self.postfixCalculator.valueStack.count);
}

@end
