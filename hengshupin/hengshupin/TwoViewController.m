//
//  TwoViewController.m
//  hengshupin
//
//  Created by 高帅 on 2018/3/4.
//  Copyright © 2018年 高帅. All rights reserved.
//

/*
 https://github.com/longxingtianxiaShuai/direction.git. 屏幕旋转没有问题 但是旋转后获取到的宽带和屏幕方向不匹配NSLog(@"%@,%f",[self class],[UIScreen mainScreen].bounds.size.width);    TwoViewController,375.000000  TwoViewController是竖屏
 */

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "AppDelegate.h"

#import <Masonry.h>
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHor];
    NSLog(@"%@,%f",[self class],[UIScreen mainScreen].bounds.size.width);
    
     self.view.backgroundColor = [UIColor whiteColor];
    [self addview];
}

- (void)addview{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"这是一个lable";
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).mas_offset(10);
        make.top.mas_equalTo(self.view).mas_offset(80);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(pushToT) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(10);
        make.top.mas_equalTo(label.mas_bottom).mas_offset(50);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
   [self setHor];
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     
}
- (void)pushToT{
    ThreeViewController *threevc = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:threevc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setHor{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.allowRotation = YES;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = UIInterfaceOrientationLandscapeLeft;
        
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        
        [invocation setArgument:&val atIndex:2];
        
        [invocation invoke];
        
    }
    

}


@end
