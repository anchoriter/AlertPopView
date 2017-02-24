//
//  MYJFShadeView.m
//  mobileapp
//
//  Created by Anchoriter on 16/9/13.
//  Copyright © 2016年 myjf. All rights reserved.
//

#import "MYJFAlertView.h"
#import "MYJFPopUpLevelView.h"
#import "MYJFBindLiveRoomView.h"
#import "MYJFNormalKey.h"


#define AnimationDurationTime 0.5

@interface MYJFAlertView ()

@property (nonatomic, strong) MYJFPopUpLevelView *popUpLevelView;
@property (nonatomic, strong) MYJFBindLiveRoomView *bindLiveRoomView;

@end
@implementation MYJFAlertView

+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)upLevel clickButtonBlock:(ClickButtonBlock)clickButtonBlock{
    
    MYJFAlertView *alertView = [[MYJFAlertView alloc] init];
    
    alertView.frame = [UIScreen mainScreen].bounds;
    alertView.backgroundColor = RGBA(0, 0, 0, 0.6);
    
    [alertView setPopUpLevelViewWithTitle:title detail:detail buttonTitle:upLevel clickButtonBlock:clickButtonBlock];
    
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    
    return alertView;
}

-(void)setPopUpLevelViewWithTitle:(NSString *)title detail:(NSString *)detail buttonTitle:(NSString *)upLevel clickButtonBlock:(ClickButtonBlock)clickButtonBlock{
    
    self.popUpLevelView = [[MYJFPopUpLevelView alloc] init];
    
    self.popUpLevelView.frame = CGRectMake(0, 0, 288*ADAPTERSCALE, 384*ADAPTERSCALE);
    self.popUpLevelView.center = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT);
    self.popUpLevelView.closeButton.hidden = YES;
    
    self.popUpLevelView.titleLabel.text = title;
    self.popUpLevelView.detailLabel.text = detail;
   
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:detail];;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, detail.length)];
    
    self.popUpLevelView.detailLabel.attributedText = attributedString;
    
    
    [self.popUpLevelView.upLevelButton setTitle:upLevel forState:UIControlStateNormal];
    
    [self addSubview:self.popUpLevelView];

    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:AnimationDurationTime animations:^{
        
        weakSelf.popUpLevelView.center = weakSelf.center;
       
    } completion:^(BOOL finished) {
        [self shakeToShow:weakSelf.popUpLevelView.closeButton];
        
        weakSelf.popUpLevelView.closeButton.hidden = NO;
    }];
    // 关闭按钮
    
    self.popUpLevelView.dismissPopView = ^{

        weakSelf.popUpLevelView.closeButton.hidden = YES;
        [UIView animateWithDuration:AnimationDurationTime animations:^{
            
            weakSelf.popUpLevelView.center = CGPointMake(SCREEN_WIDTH * 0.5, -384*ADAPTERSCALE);
            
        } completion:^(BOOL finished) {
            
            [weakSelf.popUpLevelView removeFromSuperview];
            [weakSelf removeFromSuperview];
        }];

    };
    
    self.popUpLevelView.contactService = ^{
        
        [UIView animateWithDuration:AnimationDurationTime animations:^{
            
            weakSelf.popUpLevelView.closeButton.hidden = YES;
            weakSelf.popUpLevelView.center = CGPointMake(SCREEN_WIDTH * 0.5, -384*ADAPTERSCALE);
            
        } completion:^(BOOL finished) {
            
            [weakSelf.popUpLevelView removeFromSuperview];
            [weakSelf removeFromSuperview];
            
            if (clickButtonBlock == NULL) {
                return ;
            }
            
            clickButtonBlock();
        }];

    };
    
}



- (void) shakeToShow:(UIView*)aView{
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.6, 0.6, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [aView.layer addAnimation:animation forKey:nil];
}


+(instancetype)initWithTitle:(NSString *)title detail:(NSString *)detail leftButtonBlock:(LeftButtonBlock)leftButtonBlock rightButtonBlock:(RightButtonBlock)rightButtonBlock{
    
    MYJFAlertView *alertView = [[MYJFAlertView alloc] init];
    
    alertView.frame = [UIScreen mainScreen].bounds;
    alertView.backgroundColor = RGBA(0, 0, 0, 0.6);
    
    [alertView setBindLiveRoomViewWithTitle:title detail:detail leftButtonBlock:leftButtonBlock rightButtonBlock:rightButtonBlock];
    
//    [view.window addSubview:alertView];
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
    
    return alertView;
}
-(void)setBindLiveRoomViewWithTitle:(NSString *)title detail:(NSString *)detail leftButtonBlock:(LeftButtonBlock)leftButtonBlock rightButtonBlock:(RightButtonBlock)rightButtonBlock{
    __weak typeof(self) weakSelf = self;
    
    self.bindLiveRoomView = [[MYJFBindLiveRoomView alloc] init];
    self.bindLiveRoomView.backgroundColor = [UIColor whiteColor];
    self.bindLiveRoomView.frame = CGRectMake(0, 0, 310*ADAPTERSCALE, 186*ADAPTERSCALE);
    self.bindLiveRoomView.center = self.center;
    
    self.bindLiveRoomView.titleLabel.text = title;
    self.bindLiveRoomView.detailLabel.text = detail;
    
    self.bindLiveRoomView.layer.masksToBounds = YES;
    self.bindLiveRoomView.layer.cornerRadius = 6.0*ADAPTERSCALE;
    
    [self addSubview:self.bindLiveRoomView];
    
    [self shakeToShow:self.bindLiveRoomView];
    
    self.bindLiveRoomView.cancleBind = ^{
        
        [weakSelf.bindLiveRoomView removeFromSuperview];
        [weakSelf removeFromSuperview];
        
        leftButtonBlock();
    };
    self.bindLiveRoomView.bingLiveRoom = ^{
        
        [weakSelf.popUpLevelView removeFromSuperview];
        [weakSelf removeFromSuperview];
  
        if (rightButtonBlock == NULL) {
            return ;
        }
        rightButtonBlock();
    };
}

-(void)dealloc{
   
}
@end

