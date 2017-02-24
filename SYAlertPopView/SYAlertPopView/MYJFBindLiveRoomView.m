//
//  MYJFBindLiveRoomView.m
//  mobileapp
//
//  Created by Anchoriter on 16/9/16.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import "MYJFBindLiveRoomView.h"
#import "MYJFNormalKey.h"


@implementation MYJFBindLiveRoomView

-(instancetype)init
{
    self = [super init];
    if (self)
    {

        [self setUpUI];
        [self setViewAutoLayout];  
    }
    return self;
}
- (void)setUpUI
{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15*ADAPTERSCALE];
    self.titleLabel.textColor = RGB(51, 51, 51);
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:14*ADAPTERSCALE];
    self.detailLabel.textColor = RGB(102, 102, 102);
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.detailLabel];
    
    self.leftButton = [[UIButton alloc] init];
    [self.leftButton setTitle:@"取消" forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = [UIFont boldSystemFontOfSize:18*ADAPTERSCALE];
    [self.leftButton setTitleColor:RGB(102, 102, 102) forState:UIControlStateNormal];
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"button1"] forState:UIControlStateNormal];
    [self addSubview:self.leftButton];
    
    
    self.rightButton = [[UIButton alloc] init];
    [self.rightButton setTitle:@"确定" forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:18*ADAPTERSCALE];
    [self.rightButton setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"button2"] forState:UIControlStateNormal];
    [self addSubview:self.rightButton];
    
    [self.leftButton addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(bindClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)setViewAutoLayout{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(25*ADAPTERSCALE);
        make.left.mas_equalTo(20.5*ADAPTERSCALE);
        make.right.mas_equalTo(-20.5*ADAPTERSCALE);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10*ADAPTERSCALE);
        make.left.mas_equalTo(20.5*ADAPTERSCALE);
        make.right.mas_equalTo(-20.5*ADAPTERSCALE);
        
    }];
    
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom).offset(-25*ADAPTERSCALE);
        make.left.mas_equalTo(self.titleLabel.mas_left);
        make.width.mas_equalTo(115*ADAPTERSCALE);
        make.height.mas_equalTo(40*ADAPTERSCALE);
    }];
    
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.mas_bottom).offset(-25*ADAPTERSCALE);
        make.right.mas_equalTo(self.detailLabel.mas_right);
        make.width.mas_equalTo(115*ADAPTERSCALE);
        make.height.mas_equalTo(40*ADAPTERSCALE);
    }];
    
}
- (void)bindClick
{
    
    self.bingLiveRoom();
    
}
- (void)cancelClick
{
    
    self.cancleBind();
}


@end
