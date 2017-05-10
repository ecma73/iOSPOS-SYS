//
//  DateFunction.h
//  TimeCounter
//
//  Created by IntelLigenEthics_EcMa on 2017/4/27.
//  © 2017 7AppsIonic. All Rights Reserved.
//  Git Repo: https://github.com/7appsionic

#import <Foundation/Foundation.h>

@interface DateFunction : NSObject
+ (DateFunction*)dateFunctionInstance;
- (NSDate*)latinDateToDate:(NSString*)dateString;
- (NSString*)dateToLatinDate:(NSDate*)date;
- (NSString*)DateToString:(NSDate*)aDate;
- (NSString*)DateToFullString:(NSDate*)aDate;
- (NSString*)GetTimeFormatWithDate:(NSDate*)date;
- (NSDate*)StringToDate:(NSString*)aString;
- (NSDate*)FullStringToDate:(NSString*)aString;
- (NSDate*)FullStringToDateWithoutSecond:(NSString *)aString;
- (NSString*)GetYearAndMonthWithDate:(NSString *)dateString;
- (NSString*)GetDaysBetweenDate1:(NSDate*)date1 andDate2:(NSDate*)date2;
- (NSInteger)GetWeekdayOfDate:(NSDate*)date;
- (NSInteger)calculateRealAge:(NSDate *)dateOfBirth;
- (NSInteger)calculateInsuranceAge:(NSDate *)dateOfBirth;
- (BOOL)checkIsLeapYearOfYear:(NSUInteger)year;

@end
