//
//  SuccessViewController.m
//  AlipayTouchID
//
//  Created by allthings_LuYD on 2016/10/19.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "SuccessViewController.h"

@interface SuccessViewController ()

@end

@implementation SuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
