//
//  ViewController.m
//  SYAlertPopView
//
//  Created by Anchoriter on 2017/2/24.
//  Copyright © 2017年 Anchoriter. All rights reserved.
//

#import "ViewController.h"
#import "MYJFAlertView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *alertViewCell = @"alertViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:alertViewCell];
    
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:alertViewCell];
        
    }
    
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"弹框一";
        
    }else if (indexPath.row == 1){
        
        cell.textLabel.text = @"弹框二";
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        [MYJFAlertView initWithTitle:@"小火箭" detail:@"小火箭飞呀飞~~~" buttonTitle:@"走你" clickButtonBlock:^{
            
            // 此处处理点击事件
            
        }];
    }else if (indexPath.row == 1){
        
        [MYJFAlertView initWithTitle:@"友情提示" detail:@"夜黑路滑，注意脚下" leftButtonBlock:^{
            
            
        } rightButtonBlock:^{
            
            
            
        }];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
