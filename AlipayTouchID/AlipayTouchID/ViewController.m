//
//  ViewController.m
//  AlipayTouchID
//
//  Created by allthings_LuYD on 2016/10/19.
//  Copyright © 2016年 scrum_snail. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "SuccessViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)touchID:(id)sender {
    if (self.isSimulator) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"请用真机测试~" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        return;
    }
    //it is the touch id
    LAContext *laContext = [LAContext new];
    NSError *error = nil;
    //To determine whether the device have touch ID 
    if ([laContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error]) {
        [laContext evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"请验证已有指纹" reply:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                NSLog(@"验证失败");//the system will auto to tip
            }else{
                [self presentViewController:[SuccessViewController new] animated:YES completion:nil];
            }
        }];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"不支持Touch ID~" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
    }
}

//To determine whether the device is a simulator
- (BOOL)isSimulator{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceMachine = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceMachine isEqualToString:@"i386"] || [deviceMachine isEqualToString:@"x86_64"])       {
        return YES;
    }
    return NO;
}
@end
