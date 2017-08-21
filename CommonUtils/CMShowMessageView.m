//
//  CMShowMessageView.m
//  CommonUtils
//
//  Created by ChangWingchit on 2017/8/21.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "CMShowMessageView.h"
#import <SVProgressHUD.h>

@implementation CMShowMessageView

+ (void)showErrorWithMessage:(NSString *)message
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showInfoWithStatus:message];
    
}
+ (void)showSuccessWithMessage:(NSString *)message
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showSuccessWithStatus:message];
}
+ (void)showStatusWithMessage:(NSString *)message
{
    [SVProgressHUD showWithStatus:message];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}
+ (void)hiddenErrorWithMessage
{
    [SVProgressHUD dismiss];
}
+ (void)showMessage:(NSString *)message
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD showInfoWithStatus:message];
}

@end
