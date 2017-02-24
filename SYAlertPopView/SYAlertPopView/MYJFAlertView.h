//
//  MYJFShadeView.h
//  mobileapp
//
//  Created by Anchoriter on 16/9/13.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickButtonBlock)();
typedef void(^LeftButtonBlock)();
typedef void(^RightButtonBlock)();

@interface MYJFAlertView : UIView

@property (nonatomic, copy) ClickButtonBlock clickButtonBlock;
/**
 *
 *  @param title       标题内容
 *  @param detail      描述详情
 *  @param upLevel     按钮文字
 *  @param clickButtonBlock 按钮点击事件
 *
 *  @return MYJFAlertView
 */
+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)upLevel clickButtonBlock:(ClickButtonBlock)clickButtonBlock;

+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail leftButtonBlock:(LeftButtonBlock)leftButtonBlock rightButtonBlock:(RightButtonBlock)rightButtonBlock;



@end
