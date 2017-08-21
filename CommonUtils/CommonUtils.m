//
//  CommonUntils.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "CommonUtils.h"
static CGRect oldframe;
@implementation CommonUtils

#pragma mark -
#pragma mark - 保存用户登录信息和登录状态
+(void)saveValueInUD:(id)value forKey:(NSString *)key{
    if(!value){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:value forKey:key];
    [ud synchronize];
}

+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:value forKey:key];
    [ud synchronize];
}

+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key
{
    if(!dic){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:dic forKey:key];
    [ud synchronize];
}

+(void)saveArrValueInMENU:(NSArray *)arr forKey:(NSString *)key
{
    if(!arr){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:arr forKey:key];
    [ud synchronize];
}

+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key
{
    if(!str){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:str forKey:key];
    [ud synchronize];
}

+(NSString *)getStrValueInUDWithKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud stringForKey:key];
}

+(NSArray *)getArrValueInMENUWithKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud arrayForKey:key];
}

+(BOOL)getBoolValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:key];
}

+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud dictionaryForKey:key];
}

+(void)removeValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:key];
    [ud synchronize];
}

+ (CGFloat)getLabelHeight:(UILabel*)label
{
    NSDictionary * attribute = @{NSFontAttributeName:label.font};
    CGSize  size = [label.text boundingRectWithSize:CGSizeMake(label.bounds.size.width, MAXFLOAT)
                                                 options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                              attributes:attribute
                                                 context:nil].size;
    return size.height;
}

//创建一个文件
+ (NSString*)createFileWithName:(NSString *)fileName
{
    NSArray *library = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *strLib = [[library objectAtIndex:0] stringByAppendingPathComponent:fileName];
    BOOL directory = YES;
    if (![[NSFileManager defaultManager] fileExistsAtPath:strLib isDirectory:&directory]){
        [[NSFileManager defaultManager] createDirectoryAtPath:strLib
                                  withIntermediateDirectories:NO
                                                   attributes:nil
                                                        error:nil];
    }
    return strLib;
}

#pragma mark -
#pragma mark - 判断xib是否存在
+(BOOL)nibFileExist:(NSString *)nibName{
    NSString *nibFilePath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *nibNameWithExtention = [NSString stringWithFormat:@"%@.xib", nibName];
    nibFilePath = [rootPath stringByAppendingPathComponent:nibNameWithExtention];
    return [[NSFileManager defaultManager] fileExistsAtPath:nibFilePath];
}

+(BOOL)isStringNilOrEmpty:(NSString *)str{
    if(str == nil || [@"" isEqualToString:str]){
        return YES;
    }else{
        return NO;
    }
}


#pragma mark -
#pragma mark - 判断万国码是否存在
+(NSInteger)getUnicodeLengthForStr:(NSString*)strtemp{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

#pragma mark -
#pragma mark - 归档与反归档
///归档
+ (void)keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path
{
    NSMutableData *md=[NSMutableData data];
    NSKeyedArchiver *arch=[[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
    [arch encodeObject:object forKey:key];
    [arch finishEncoding];
    [md writeToFile:path atomically:YES];
}

///反归档
+ (NSArray *)keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path
{
    NSData *data=[NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unArch=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSArray *arr = [unArch decodeObjectForKey:key];
    return arr;
}

//归档
+ (void)keyedArchiverObject:(id)object ToFile:(NSString *)path
{
    if (!path) {
        return;
    }
    [NSKeyedArchiver archiveRootObject:object toFile:path];
}

//反归档
+ (NSArray *)keyedUnArchiverFromFile:(NSString *)path
{
    NSArray *arr = [NSArray new];
    arr = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return arr;
}

#pragma mark -
#pragma mark - 提示窗口
+(void)showDialogWithTaget:(nullable id)taget andTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate
{
    
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    
    
}

+(void)showDialogWithTwoBtnsTaget:(nullable id)taget andWithTitle:(NSString *)title message:(NSString *)msg delegate:(nullable id)delegate
{
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    }
    
}

+(void)showDialogWithTwoBtnsTaget:(nullable id)taget andWithTitle:(NSString *)title firstBtnMsg:(NSString*)msg1 secondBtnMsg:(NSString*)msg2 message:(NSString *)msg delegate:(nullable id)delegate
{
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:title
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:msg1 style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:msg2 style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        [alert show];
    }
    
}

+(void)showAlertWithTaget:(nullable id)taget andMsg:(NSString *)msg
{
    Class class = NSClassFromString(@"UIAlertController");
    if (class) {
        
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"友情提示"
                                            message:msg
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:action1];
        [taget presentViewController:alertController animated:YES completion:nil];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        
    }
    
}

#pragma mark -
#pragma mark - 正则表达式判断
//利用正则表达式验证邮箱的合法性
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(BOOL)isValidatePassword:(NSString *)pw {
    //验证密码（只能是数字且为6位）
    NSString *emailRegex= @"^\\d{6}$";
    //    NSString *emailRegex = @"[A-Z0-9a-z_]{6,15}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:pw];
}
+(BOOL)isAlphbet:(NSString *)pw {
    NSString *emailRegex = @"[A-Za-z]{1}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:pw];
}
+(BOOL)isValidateNickname:(NSString *)nickName {
    //验证昵称(只能是汉字，字母或二者组合，最少2位)
    NSString *emailRegex= @"^[a-zA-Z\u4e00-\u9fa5]{2,4}$";
    //    NSString *emailRegex = @"[A-Z 0-9a-z\u4e00-\u9fa5]{1,15}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:nickName];
}
+(BOOL)isValidatePhoneNum:(NSString *)phone
{
    //    NSString *secretRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";
    NSString *phoneRegex = @"^((147)|((17|13|15|18|14)[0-9]))\\d{8}$";//@"\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{11}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

+(BOOL)isValidateTelephoneNum:(NSString *)phone{
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    return [phoneTest evaluateWithObject:phone];
}
+(BOOL)isValidateTelephone:(NSString *)phone
{
    NSString * PHS = @"(”^(\\d{3,4}-)\\d{7,8}$”)";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",PHS];
    return [phoneTest evaluateWithObject:phone];
}

+(BOOL)isValidateNumber:(NSString *)number
{
    NSString * num = @"^[0-9]*$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",num];
    return [numberTest evaluateWithObject:number];
}

+(BOOL)isValidateChinese:(NSString *)chineseName
{
    NSString *chineseStr = @"^[\u4e00-\u9fa5]{0,}$";
    NSPredicate *chineseTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",chineseStr];
    return [chineseTest evaluateWithObject:chineseName];
}

+(BOOL)isStrFitRegex:(NSString *)str regex:(NSString *)regex{
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pwdTest evaluateWithObject:str];
}
+ (BOOL)isValidateAreaCodeNum:(NSString *)areaCodePhone
{
    NSString * num = @"^\\d{3,4}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",num];
    return [numberTest evaluateWithObject:areaCodePhone];
}
+ (BOOL)isValidateSevenNum:(NSString *)SevenNum
{
    NSString * num = @"^\\d{7,8}$";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",num];
    return [numberTest evaluateWithObject:SevenNum];
}

+ (BOOL)isValidateUsername:(NSString *)userName
{
    //验证用户名（只能是字母组成且为6～12位）
    NSString *emailRegex = @"^[A-Za-z]{6,12}$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:userName];
}

+(NSDate *)getDateFromTimeInternalDateStr:(NSString *)d{
    if([self isStringNilOrEmpty:d]){
        return nil;
    }else{
        return [NSDate dateWithTimeIntervalSince1970:[d longLongValue]/1000];
    }
}


//两个时间之差
+ (NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSArray *timeArray1=[dateString1 componentsSeparatedByString:@"."];
    dateString1=[timeArray1 objectAtIndex:0];
    
    
    NSArray *timeArray2=[dateString2 componentsSeparatedByString:@"."];
    dateString2=[timeArray2 objectAtIndex:0];
    
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    
    NSDate *d1=[date dateFromString:dateString1];
    
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    
    
    
    NSDate *d2=[date dateFromString:dateString2];
    
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    
    
    
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    NSString *house=@"";
    NSString *min=@"";
    NSString *sen=@"";
    
    sen = [NSString stringWithFormat:@"%d", (int)cha%60];
    //        min = [min substringToIndex:min.length-7];
    //    秒
    sen=[NSString stringWithFormat:@"%@", sen];
    
    
    
    min = [NSString stringWithFormat:@"%d", (int)cha/60%60];
    //        min = [min substringToIndex:min.length-7];
    //    分
    min=[NSString stringWithFormat:@"%@", min];
    
    
    //    小时
    house = [NSString stringWithFormat:@"%d", (int)cha/3600];
    //        house = [house substringToIndex:house.length-7];
    house=[NSString stringWithFormat:@"%@", house];
    
    
    timeString=[NSString stringWithFormat:@"%@:%@:%@",house,min,sen];
    
    
    return timeString;
}

//时间转化成字符串
+ (NSString * )NSDateToNSString: (NSDate * )date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

#pragma - mark 图片点击放大缩小
+(void)showImage:(UIImageView *)avatarImageView{
    
    UIImage *image = avatarImageView.image;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe = [avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = 0;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:oldframe];
    imageView.image = image;
    imageView.tag = 1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView = tap.view;
    UIImageView *imageView = (UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame = oldframe;
        backgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}

@end
