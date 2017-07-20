//
//  SecController.m
//  LDD-4
//
//  Created by 李洞洞 on 20/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "SecController.h"
#import "masonry.h"
@interface SecController ()

@end

@implementation SecController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}
- (void)setUpUI
{
    self.view.layer.cornerRadius = 10;
    self.view.layer.masksToBounds = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView * imV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01"]];
    [self.view addSubview:imV];
    [imV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
    
    UIButton * btn = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 50, 30)];
        [btn setTitle:@"Dismiss" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor cyanColor]];
        [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:btn];
    
}
- (void)dismiss
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(secControllerDismiss)]) {
        [self.delegate secControllerDismiss];
    }
}
@end
