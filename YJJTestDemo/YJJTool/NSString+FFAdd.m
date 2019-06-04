//
//  NSString+FFAdd.m
//  QPApp
//
//  Created by Juff on 16/2/19.
//  Copyright © 2016年 Lianni. All rights reserved.
//

#import "NSString+FFAdd.h"

@implementation NSString (FFAdd)

- (NSString *)stringByDecodingURLFormat {
    return [self stringByRemovingPercentEncoding];
}

- (NSString *)stringByURLEncodingStringParameter {
    NSCharacterSet *c = [[NSCharacterSet characterSetWithCharactersInString:@"!*'\"();:@&=+$,/?%#[ ]"] invertedSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:c];
}

- (NSString *)Uuid{
//    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
//    CFStringRef strUuid = CFUUIDCreateString(kCFAllocatorDefault,uuid);
//    NSString * str = [NSString stringWithString:(__bridge NSString *)strUuid];
//    CFRelease(strUuid);
//    CFRelease(uuid);
    NSUUID *str = [UIDevice currentDevice].identifierForVendor;
//    NSLog(@"uuid 1 = %@",str.UUIDString);
    return  str.UUIDString;
}
- (NSString *)removeStringBlankSpace{
    return  [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (NSString *)isPhoneNumString
{
    if(self.length == 0) return @"手机号不能为空";
    NSPredicate *testPhone = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",@"^1\\d{10}$"];
    if(![testPhone evaluateWithObject:self]){
        return @"手机号码不正确,请检查重新输入";
    }
    return nil;
}

- (BOOL)isNilString{
    NSString *str = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(str.length == 0)
    {
        return YES;
    }
    return NO;
}

- (NSString*)isDigitalWithLetterString:(NSString *)text length:(NSRange)range{
    
    if(self.length < range.location || self.length > range.length)
    {
        return[NSString stringWithFormat:@"%@位数不符合,请输入%lu~%lu位字符",text,(unsigned long)range.location,(unsigned long)range.length];
    }
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-zA-Z]\\w+$"];
    if(![pred evaluateWithObject:self]){
        return[NSString stringWithFormat:@"%@由字母、数字和下划线组成,且需要字母开头,请检查重新输入",text];
    }
    return nil;
}
- (NSString *)removeSpacesString{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}


#pragma mark - 身份证 校验

/**
 身份证校验
 */
- (BOOL)isValidateIdentityCard
{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

/**
 银行卡 校验 //2银行卡,  16、18、19 位数字

 */
- (BOOL)isValidateBankCard
{
    NSString *regex = @"^\\d{16}|\\d{18}|\\d{19}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:self];
}

/**
 验证邮箱格式是否正确

 */
- (BOOL)isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:self];
}

/**
 验证输入金额
 @return 结果值
 */
- (BOOL)isValidateAmountPositiveNum{
    NSString *regex = @"^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regExPredicate evaluateWithObject:self];
}

- (NSString *)isIDCard{
    NSString *cardNum = [NSString stringWithFormat:@"%@",self];
    cardNum = [cardNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(self.length != 18 ) return @"身份证号位数不对,请重新输入";
    NSArray *cardNumArr = [self componentStringByCharactersToArray:self];
    NSArray *w          = @[@(7),@(9),@(10),@(5),@(8),@(4),@(2),@(1),@(6),@(3),@(7),@(9),@(10),@(5),@(8),@(4),@(2)];
    NSArray *c          = @[@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2"];
    NSInteger sum       = 0;
    for (NSInteger i = 0; i < 17; i++)
    {
        sum = sum + [cardNumArr[i] integerValue] * [w[i] integerValue];
    }
    return [c[sum%11] isEqualToString:cardNumArr[17]] ? @"":@"身份证号不正确,请重新输入";
}
- (BOOL)isPass
{
    NSString *pass = @"^[A-Za-z0-9]{6,20}$";
    NSPredicate *passTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pass];
    return [passTest evaluateWithObject:self];
}

- (CGSize)calculateTextSize:(CGSize)size font:(NSInteger)font{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    
    CGSize retSize = [self boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}
- (NSAttributedString *)ff_fontAttributeName:(NSInteger)fontSize{
    return [[NSAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
}
- (NSAttributedString *)ff_foregroundColorAttributeName:(UIColor *)color{
    return [[NSAttributedString alloc] initWithString:self attributes:@{NSForegroundColorAttributeName:color}];
}

- (NSAttributedString *)ff_foregroundColorName:(UIColor *)color withFont:(NSInteger)font{
    return [[NSAttributedString alloc] initWithString:self attributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:[UIFont systemFontOfSize:font]}];
}
-(NSMutableAttributedString *)attrStrFrom:(NSString *)allString colorStr:(NSString *)colorStr color:(UIColor *)color font:(CGFloat )font
{
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:allString];
    // 设置前面几个字串的格式:字号字体、颜色
    [arrString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],
                               NSForegroundColorAttributeName:color
                               }
                       range:[allString rangeOfString:colorStr]];
    return arrString;
}

-(NSMutableAttributedString *)appendAttributeString:(NSString *)string color:(UIColor *)color font:(UIFont *)font {
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc] initWithString:self];
    [arrString appendAttributedString:[[NSAttributedString alloc] initWithString:string
                                                                      attributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}]];
    return arrString;
}

-(NSMutableAttributedString *)appendAttributeRange:(NSRange)range color:(UIColor *)color font:(UIFont *)font {
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:self];
    [arrString addAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color}
                       range:range];
    return arrString;
}

-(NSMutableAttributedString *)dinAttrStrFrom:(NSString *)allString colorStr:(NSString *)colorStr color:(UIColor *)color font:(CGFloat )font
{
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:allString];
    // 设置前面几个字串的格式:字号字体、颜色 //中黑
    [arrString addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"DINPro-Medium" size:font],
                               NSForegroundColorAttributeName:color
                               }
                       range:[allString rangeOfString:colorStr]];
    return arrString;
}

- (NSArray *)componentStringByCharactersToArray:(NSString *)string{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i<string.length; i++) {
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        [arr addObject:s];
    }
    return arr;
}

//砖标准时间

- (NSString *)changeStandardTimeWithDateFormat:(NSString *)format {
    NSString *str = self;
    NSTimeInterval timeInterval = [str doubleValue];
    if(timeInterval == 0) return @"";
    if(self.length > 10)
    {
        str = [self substringWithRange:NSMakeRange(0, 10)];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];//时区
    NSString *retu = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[str doubleValue]]];
    return  retu;

}

- (NSString *)changeStandardTime:(TimeType)type{
    NSString *str = self;
    NSTimeInterval timeInterval = [str doubleValue];
    if(timeInterval == 0) return str;
    if(self.length > 10)
    {
        str = [self substringWithRange:NSMakeRange(0, 10)];
    }
    
    NSString *timeTypeStr = @"yyyy-MM-dd HH:mm:ss";
    switch (type) {
        case yyyy_MM_dd_HH_mm:
            timeTypeStr = @"yyyy-MM-dd HH:mm";
            break;
        case yyyy_MM_dd_HH_mm_ss:
            timeTypeStr = @"yyyy-MM-dd HH:mm:ss";
        case yyyy_MM_dd:
            timeTypeStr = @"yyyy-MM-dd";
            
        default:
            break;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:timeTypeStr];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];//时区
    return  [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[str doubleValue]]];
}

//转时间戳
- (NSString *)changeTimeStamp{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [NSString stringWithFormat:@"%.0f", [[dateFormatter dateFromString:self] timeIntervalSince1970]];
}


- (NSString *)isNullReturnLin {
    
    if (self.length == 0 || self == nil || [self isEqual:[NSNull null]] || [self isEqualToString:@"null"]) {
        return @"0";
    }
    return self;
}

- (NSString *)moneyFormatting{
    
    
    NSString *str = [NSString stringWithFormat:@"%.2f",[self doubleValue]];

    NSMutableString *money = [NSMutableString string];
    
    NSString *afer = [str substringFromIndex:(str.length - 3)];
    
    NSString *strPro = [str substringToIndex:(str.length - 3)];
    
    
    if (strPro.length == 3) {
        [money appendString:strPro];
    }else{
        int time = (int)(strPro.length) / 3;
        int yu = strPro.length % 3;
        
        [money appendString:[strPro substringToIndex:yu]];
        if (time >= 1) {
            for (int i = 0; i < time; i++) {
                if (0 == yu && i == 0) {
                }else{
                    [money appendString:@","];
                }
                [money appendString:[strPro substringWithRange:NSMakeRange(yu + 3 * i, 3)]];
                
            }
        }
    }
    
    [money appendString:afer];
    return money;
}
/**
 
 用*替换字符串
 
 */
- (NSString *)replaceWithStartType:(KStartReplaceType)type;
{
    if (!self.length) {
        return @"";
    }
    NSString *newStr = @"";
    NSRange range = NSMakeRange(0, 0);
    NSString *repStr = nil;
    if (type == kStartReplaceType_ReadName) {
        range = NSMakeRange(1, self.length-1);
        repStr = [self startStr:self.length-1];
    }else if(type == kStartReplaceType_PhoneNum){
        range = NSMakeRange(3, 4);  // 133****3333
        repStr = [self startStr:4];
    }else{   // lk******@qq.com
        range = NSMakeRange(2, ([self rangeOfString:@"@"].location -2));
        repStr = [self startStr:([self rangeOfString:@"@"].location -2)];
    }
    if (self.length >= range.length + range.location) {
        if ([repStr isKindOfClass:[NSString class]]) {
            if (repStr == nil) {
                repStr = @"";
            }
        }
        newStr = [self stringByReplacingCharactersInRange:range withString:repStr];
    }
    return newStr;
}

- (NSString *)startStr:(NSInteger)num{
    NSMutableString *repStr = [NSMutableString string];
    for (int i = 0; i<num ;i++) {
        [repStr appendFormat:@"*"];
    }
    
    return repStr;
}

- (NSString *)repeat:(NSInteger)count {
    NSMutableString *repStr = [NSMutableString string];
    for (int i = 0; i<count ;i++) {
        [repStr appendString:self];
    }
    return repStr;
}

/*
 G: 公元时代，例如AD公元
 yy: 年的后2位
 yyyy: 完整年
 MM: 月，显示为1-12
 MMM: 月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd: 日，2位数表示，如02
 d: 日，1-2位显示，如 2
 EEE: 简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa: 上下午，AM/PM
 H: 时，24小时制，0-23
 K：时，12小时制，0-11
 m: 分，1-2位
 mm: 分，2位
 s: 秒，1-2位
 ss: 秒，2位
 S: 毫秒
 */

+ (void)phoneFormatTextField:(UITextField *)textField PreviousTextFieldContent:(NSString *)previousTextFieldContent {
    if (textField.text.length > 13) {
        textField.text = [textField.text substringToIndex:13];
    }
    
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument toPosition:textField.selectedTextRange.start];
    
    NSString *currentStr = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *preStr = [previousTextFieldContent stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //正在执行删除操作时为0，否则为1
    char editFlag = 0;
    if (currentStr.length <= preStr.length) {
        editFlag = 0;
    }
    else {
        editFlag = 1;
    }
    NSMutableString *tempStr = [NSMutableString new];
    
    int spaceCount = 0;
    if (currentStr.length < 3 && currentStr.length > -1) {
        spaceCount = 0;
    }else if (currentStr.length < 7 && currentStr.length > 2) {
        spaceCount = 1;
    }else if (currentStr.length < 12 && currentStr.length > 6) {
        spaceCount = 2;
    }
    
    for (int i = 0; i < spaceCount; i++) {
        if (i == 0) {
            [tempStr appendFormat:@"%@%@", [currentStr substringWithRange:NSMakeRange(0, 3)], @" "];
        }else if (i == 1) {
            [tempStr appendFormat:@"%@%@", [currentStr substringWithRange:NSMakeRange(3, 4)], @" "];
        }else if (i == 2) {
            [tempStr appendFormat:@"%@%@", [currentStr substringWithRange:NSMakeRange(7, 4)], @" "];
        }
    }
    
    if (currentStr.length == 11) {
        [tempStr appendFormat:@"%@%@", [currentStr substringWithRange:NSMakeRange(7, 4)], @" "];
    }
    if (currentStr.length < 4) {
        [tempStr appendString:[currentStr substringWithRange:NSMakeRange(currentStr.length - currentStr.length % 3, currentStr.length % 3)]];
    }else if(currentStr.length > 3 && currentStr.length <12) {
        NSString *str = [currentStr substringFromIndex:3];
        [tempStr appendString:[str substringWithRange:NSMakeRange(str.length - str.length % 4, str.length % 4)]];
        if (currentStr.length == 11) {
            [tempStr deleteCharactersInRange:NSMakeRange(13, 1)];
        }
    }
    textField.text = tempStr;
    // 当前光标的偏移位置
    NSUInteger curTargetCursorPosition = targetCursorPosition;
    if (editFlag == 0) {
        //删除
        if (targetCursorPosition == 9 || targetCursorPosition == 4) {
            curTargetCursorPosition = targetCursorPosition - 1;
        }
    }else {
        //添加
        if (currentStr.length == 8 || currentStr.length == 4) {
            curTargetCursorPosition = targetCursorPosition + 1;
        }
    }
//    curTargetCursorPosition = tempStr.length;
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument] offset:curTargetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition toPosition :targetPosition]];
}
/**
 判断数字
 @return
 */-(BOOL)isNumCheckedNumString{
    if (self.length == 0) {
        return NO;
    }
//    NSString *regex = @"[0-9]";
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
//    if ([pred evaluateWithObject:self]) {
//        return YES;
//    }
//    return NO;
    NSString *string = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

+(NSString *)getDateForFormatterStr:(NSString *)formatter{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:formatter];
    return [dateformatter stringFromDate:senddate];
}
@end


@implementation NSMutableAttributedString (FFAdd)

- (void)stringSpaceBetween:(NSInteger)distance{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:distance];
    [self addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.length)];
}


@end
