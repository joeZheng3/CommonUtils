//
//  CommonUntils.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface CommonUtils : NSObject

#pragma mark - 保存用户登录信息和登录状态
//保存值
+(void)saveValueInUD:(id)value forKey:(NSString *)key;

//保存登录信息
+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key;
+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key;

//获取登录信息
+(BOOL)getBoolValueInUDWithKey:(NSString *)key;
+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key;

//保存菜单信息
+(void)saveArrValueInMENU:(NSArray *)arr forKey:(NSString *)key;
//获取菜单信息
+(NSMutableArray *)getArrValueInMENUWithKey:(NSString *)key;

//保存版本信息
+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key;
//获取版本信息
+(NSString *)getStrValueInUDWithKey:(NSString *)key;

+(void)removeValueInUDWithKey:(NSString *)key;

//获取文本高度
+ (CGFloat)getLabelHeight:(UILabel*)label;

//在libaray下创建一个文件
+ (NSString*)createFileWithName:(NSString *)fileName;

#pragma mark - 归档和反归档
+ (void) keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path;
+ (NSArray *) keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path;
//整存
+ (void) keyedArchiverObject:(id)object ToFile:(NSString *)path;
+ (NSArray *)keyedUnArchiverFromFile:(NSString *)path;

+(void)showAlertWithTaget:(nullable id)taget andMsg:(NSString *)msg;

#pragma mark - App日常常用方法
+(void)showDialogWithTwoBtnsTaget:(nullable id)taget andWithTitle:(NSString *)title firstBtnMsg:(NSString*)msg1 secondBtnMsg:(NSString*)msg2 message:(NSString *)msg delegate:(nullable id)delegate;
/*!
 @method
 @abstract 只有一个“确定”按钮的系统提示对话框
 @param title 标题
 @param msg 提示消息内容
 @param delegate 对话框点击后回调委托
 @param taget 对话框tag，用于同一viewController多个提示框中区分
 */
+(void)showDialogWithTaget:(nullable id)taget andTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate;

/*!
 @method
 @abstract 有“确定”、"取消"按钮的系统提示对话框
 @param title 标题
 @param msg 提示消息内容
 @param delegate 对话框点击后回调委托
 @param taget 对话框tag，用于同一viewController多个提示框中区分
 */
+(void)showDialogWithTwoBtnsTaget:(nullable id)taget andWithTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate;


/*!
 @method
 @abstract 判断nib文件是否存在
 @param nibName nib文件名称
 @result YES 存在 NO 不存在
 */
+(BOOL)nibFileExist:(NSString *)nibName;

/*!
 @method
 @abstract 获取字符串unicode的长度
 @discussion 英文一个字符长度为1，中文一个字符长度为2
 @param strtemp 要判断的字符串
 @result 字符串unicode的长度
 */
+(NSInteger)getUnicodeLengthForStr:(NSString*)strtemp;

/*!
 @method
 @abstract 判断字符串是否为空或nil
 @param str 要判断的字符串
 @result YES 字符串为nil或空  NO 字符串非空
 */
+(BOOL)isStringNilOrEmpty:(NSString *)str;

/*!
 @method
 @abstract 邮箱合法型正则表达式判断
 @param email 要判断的字符串
 @result YES 合法  NO 不合法
 */
+(BOOL)isValidateEmail:(NSString *)email;

/*!
 @method
 @abstract 数字合法型正则表达式判断
 @param number 要判断的字符串
 @result YES 合法  NO 不合法
 */
+(BOOL)isValidateNumber:(NSString *)number;

+(BOOL)isValidatePassword:(NSString *)pw;
+(BOOL)isValidateNickname:(NSString *)nickName;

/*!
 @method
 @abstract 手机号码合法型正则表达式判断
 @param phone 要判断的字符串
 @result YES 合法  NO 不合法
 */
+(BOOL)isValidatePhoneNum:(NSString *)phone;

/*!
 @method
 @abstract 固定电话合法型正则表达式判断
 @param phone 要判断的字符串
 @result YES 合法  NO 不合法
 */

+(BOOL)isValidateTelephoneNum:(NSString *)phone;
/*!
 @method
 @abstract 固定电话家横杆合法型正则表达式判断
 @param phone 要判断的字符串
 @result YES 合法  NO 不合法
 */

+(BOOL)isValidateTelephone:(NSString *)phone;
/**
 *  中文合法型正则表达式判断
 *
 *  @param chineseName 要判断的字符串
 *
 *  @return YES 合法  NO 不合法
 */

+(BOOL)isValidateChinese:(NSString *)chineseName;

/**
 *  区号合法型正则表达式判断
 *
 *  @param areaCodePhone 要判断的字符串
 *
 *  @return YES 合法  NO 不合法
 */
+(BOOL)isValidateAreaCodeNum:(NSString *)areaCodePhone;

/**
 *  7~8位数字合法型正则表达式判断
 *
 *  chineseName 要判断的字符串
 *
 *  @return YES 合法  NO 不合法
 */
+(BOOL)isValidateSevenNum:(NSString *)SevenNum;

/*!
 @method
 @abstract 利用正则表达式判断字符串是否符合规则
 @param str 要判断的字符串
 @param regex 正则表达式字符串
 @result YES 合法  NO 不合法
 */
+(BOOL)isStrFitRegex:(NSString *)str regex:(NSString *)regex;

/*!
 @method
 @abstract 利用正则表达式判断用户名是否符合规则
 @param userName 要判断的字符串
 @result YES 合法  NO 不合法
 */
+ (BOOL)isValidateUsername:(NSString *)userName;

//计算两个时间点之间的时间差
+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2;
//时间转化字符串
+ (NSString * )NSDateToNSString: (NSDate * )date;

/*图片点击放大缩小
 @avatarImageView 需要缩放的imageView
 */
+(void)showImage:(UIImageView*)avatarImageView;

+(NSDate *)getDateFromTimeInternalDateStr:(NSString *)d;

@end
NS_ASSUME_NONNULL_END
