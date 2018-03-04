//
//  ThreeViewController.m
//  hengshupin
//
//  Created by 高帅 on 2018/3/4.
//  Copyright © 2018年 高帅. All rights reserved.
//

#import "ThreeViewController.h"
#import "AppDelegate.h"
#import <Masonry.h>
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setPor];
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
        make.top.mas_equalTo(self.view).mas_offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(30);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setPor{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    delegate.allowRotation = NO;
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        
        int val = UIInterfaceOrientationPortrait;
        
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        
        [invocation setArgument:&val atIndex:2];
        
        [invocation invoke];
        
    }
    
}


@end
