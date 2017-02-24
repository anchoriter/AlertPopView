//
//  MYJFPopUpLevelView.m
//  mobileapp
//
//  Created by Anchoriter on 16/9/13.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import "MYJFPopUpLevelView.h"
#import "MYJFNormalKey.h"

@interface MYJFPopUpLevelView ()


@end
@implementation MYJFPopUpLevelView
-(instancetype)init{
    self = [super init];
    if (self) {
        
        [self setUpUI];
        [self setViewAutoLayout];
    }
    return self;
}
- (void)setUpUI{
    
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.image = [UIImage imageNamed:@"Pop-background"];
    [self addSubview:self.bgImageView];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18*ADAPTERSCALE];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textColor = RGB(51, 51, 51);
    [self.titleLabel sizeToFit];
    [self addSubview:self.titleLabel];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:14*ADAPTERSCALE];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textColor = RGB(68, 68, 68);
    [self.detailLabel sizeToFit];
    [self addSubview:self.detailLabel];

    
    self.upLevelButton = [[UIButton alloc] init];
    self.upLevelButton.titleLabel.font = [UIFont systemFontOfSize:18*ADAPTERSCALE];
    [self.upLevelButton setTitleColor:RGB(255, 255, 255) forState:UIControlStateNormal];
    [self.upLevelButton setBackgroundImage:[UIImage imageNamed:@"tanchuangbutton"] forState:UIControlStateNormal];
    [self.upLevelButton addTarget:self action:@selector(upLevel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.upLevelButton];
    
    self.closeButton = [[UIButton alloc] init];
    [self.closeButton setImage:[UIImage imageNamed:@"guanbi"] forState:UIControlStateNormal];
    [self.closeButton addTarget:self action:@selector(closePopView) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.closeButton];
    


}
-(void)setViewAutoLayout{
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(330*ADAPTERSCALE);
        make.width.mas_equalTo(288*ADAPTERSCALE);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(29*ADAPTERSCALE);
        make.width.mas_equalTo(29*ADAPTERSCALE);
    }];
    
    [self.upLevelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.bgImageView.mas_centerX);
        make.bottom.mas_equalTo(self.bgImageView.mas_bottom).offset(-25*ADAPTERSCALE);
        make.width.mas_equalTo(240*ADAPTERSCALE);
        make.height.mas_equalTo(36*ADAPTERSCALE);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.upLevelButton.mas_top).offset(-25*ADAPTERSCALE);
        make.width.mas_equalTo(240*ADAPTERSCALE);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.detailLabel.mas_top).offset(-21*ADAPTERSCALE);
        make.width.mas_equalTo(240*ADAPTERSCALE);
        
    }];
    
}
- (void)upLevel {
    
    self.contactService();

}
- (void)closePopView {

    self.dismissPopView();
}

@end
