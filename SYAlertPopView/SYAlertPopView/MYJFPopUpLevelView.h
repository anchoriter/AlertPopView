//
//  MYJFPopUpLevelView.h
//  mobileapp
//
//  Created by Anchoriter on 16/9/13.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DismissPopView)();
typedef void(^ContactService)();

@interface MYJFPopUpLevelView : UIView


// 背景图片
@property (strong, nonatomic) UIImageView *bgImageView;
// 标题
@property (strong, nonatomic) UILabel *titleLabel;
// 详情描述
@property (strong, nonatomic) UILabel *detailLabel;
@property (strong, nonatomic) UIButton *upLevelButton;
// 关闭按钮
@property (strong, nonatomic) UIButton *closeButton;

@property (nonatomic,copy) DismissPopView dismissPopView;
@property (nonatomic,copy) ContactService contactService;


@end
