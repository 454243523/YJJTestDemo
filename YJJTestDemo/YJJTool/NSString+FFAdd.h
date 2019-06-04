//
//  NSString+FFAdd.h
//  QPApp
//
//  Created by Juff on 16/2/19.
//  Copyright © 2016年 Lianni. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger) {
    yyyy_MM_dd,
    yyyy_MM_dd_HH_mm,//yyyy-MM-dd HH:mm
    yyyy_MM_dd_HH_mm_ss,
}TimeType;


typedef NS_ENUM(NSInteger) {
    kStartReplaceType_ReadName,
    kStartReplaceType_PhoneNum,
    kStartReplaceType_Email,
}KStartReplaceType;

@interface NSString (FFAdd)
//根据格式返回当前时间
+ (NSString *)getDateForFormatterStr:(NSString *)formatter;


- (NSString *)stringByDecodingURLFormat;

- (NSString *)stringByURLEncodingStringParameter;

- (NSString *)Uuid;

- (NSString *)isPhoneNumString;

- (NSString *)isIDCard;

- (BOOL)isNilString;

- (NSString *)removeSpacesString;

- (NSAttributedString *)ff_fontAttributeName:(NSInteger)num;

- (NSAttributedString *)ff_foregroundColorAttributeName:(UIColor *)color;

- (NSAttributedString *)ff_foregroundColorName:(UIColor *)color withFont:(NSInteger)font;

-(NSMutableAttributedString *)attrStrFrom:(NSString *)allString colorStr:(NSString *)colorStr color:(UIColor *)color font:(CGFloat )font;

-(NSMutableAttributedString *)dinAttrStrFrom:(NSString *)allString colorStr:(NSString *)colorStr color:(UIColor *)color font:(CGFloat )font;
- (CGSize)calculateTextSize:(CGSize)size font:(NSInteger)font;

-(NSMutableAttributedString *)appendAttributeString:(NSString *)string color:(UIColor *)color font:(UIFont *)font;

-(NSMutableAttributedString *)appendAttributeRange:(NSRange)range color:(UIColor *)color font:(UIFont *)font;


- (NSString *)removeStringBlankSpace;

/**
 时间转化

 @param format 格式为yyyy-MM-dd HH:mm:ss 等.

 @return
 */
- (NSString *)changeStandardTimeWithDateFormat:(NSString *)format;
- (NSString *)changeStandardTime:(TimeType)type;
- (NSString *)changeTimeStamp;




/**
 价格为0
 */
- (NSString *)isNullReturnLin;

/**
 用*替换字符串
 */
- (NSString *)replaceWithStartType:(KStartReplaceType)type;
/**
 银行卡 校验 //2银行卡,  16、18、19 位数字
 
 */
- (BOOL)isValidateBankCard;
/**
 验证邮箱格式是否正确
 
 */
- (BOOL)isValidateEmail;
/**
 验证输入金额   只能是数字或小数点 全是正数
 @return 结果值
 */
- (BOOL)isValidateAmountPositiveNum;
/**
 身份证校验
 */
- (BOOL)isValidateIdentityCard;

- (NSString *)moneyFormatting;
//电话号码3 4 4 格式
+ (void)phoneFormatTextField:(UITextField *)textField PreviousTextFieldContent:(NSString *)previousTextFieldContent;
/**
 判断数字
 @return
 */
-(BOOL)isNumCheckedNumString;
/**
 限制密码输入
 @return
 */
- (BOOL)isPass;

- (NSString *)repeat:(NSInteger)count;
@end

@interface NSMutableAttributedString (FFAdd)

- (void)stringSpaceBetween:(NSInteger)distance;

@end
