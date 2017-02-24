//
//  MYJFBindLiveRoomView.h
//  mobileapp
//
//  Created by Anchoriter on 16/9/16.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CancleBind)();
typedef void(^BingLiveRoom)();

@interface MYJFBindLiveRoomView : UIView
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *detailLabel;

@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;

@property (nonatomic,copy) CancleBind cancleBind;
@property (nonatomic,copy) BingLiveRoom bingLiveRoom;
@end
