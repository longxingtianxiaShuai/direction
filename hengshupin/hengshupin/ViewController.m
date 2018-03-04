//
//  ViewController.m
//  hengshupin
//
//  Created by 高帅 on 2018/3/4.
//  Copyright © 2018年 高帅. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import <Masonry.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
- (IBAction)pushto:(id)sender {
    TwoViewController *viwec = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:viwec animated:YES];
}


@end
