//
//  ThreeViewController.m
//  hengshupin
//
//  Created by 高帅 on 2018/3/4.
//  Copyright © 2018年 高帅. All rights reserved.
//

#import "ThreeViewController.h"
#import <Masonry.h>
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
