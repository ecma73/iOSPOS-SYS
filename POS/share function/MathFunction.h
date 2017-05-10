//
//  MathFunction.h
//  MLIproposal
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface MathFunction : NSObject

+ (MathFunction*)mathFunctionInstance;
- (BOOL)isPureInt:(NSString*)string;
- (BOOL)isPureFloat:(NSString*)string;
// Rounding, unconditional rounding, unconditional carry
- (NSNumber*)roundWithDigit:(NSUInteger)digit andRoundNumber:(NSNumber*)number;
- (NSNumber*)ceilWithDigit:(NSUInteger)digit andCeilNumber:(NSNumber*)number;
- (NSNumber*)floorWithDigit:(NSUInteger)digit andFloorNumber:(NSNumber*)number;
//display digital
- (NSString*)displayDefaultNumberWithNumber:(NSNumber*)number;
- (NSString*)displayDefaultNumberWithNumber:(NSNumber *)number andDigit:(NSUInteger)digit;
- (NSString*)displayPercentageWithNumber:(NSNumber*)number;
- (NSString*)displayPercentageWithNumber:(NSNumber*)number andDigit:(NSUInteger)digit;
- (NSString*)displayRateWithNumber:(NSNumber*)number;
//Than the size
- (NSNumber*)maxNumberWithNumber:(double)num1 andOther:(double)num2;
@end
