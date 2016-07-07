//
//  LoginVC.m
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import "LoginVC.h"
@interface LoginVC()

@property (nonatomic,strong) UITextField *username;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIViewBase *background;    //背景颜色

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView {
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    
    _background=[[UIViewBase alloc] initWithFrame:CGRectMake(20,  self.view.frame.size.height/2-100, self.view.frame.size.width-40, 50)];
    [_background setBackgroundColor:[UIColor whiteColor]];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setMasksToBounds:YES];
    [self.view addSubview:_background];
    
    _username = [[UITextField alloc] initWithFrame:CGRectMake(20,  self.view.frame.size.height/2-100, self.view.frame.size.width-40,50)];
    _username.backgroundColor = [UIColor whiteColor];
    _username.placeholder = [NSString stringWithFormat:@"user1 or user2"];
    _username.layer.cornerRadius = 5.0;
    [self.view addSubview:_username];
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginButton.layer.cornerRadius = 10.0;
    [_loginButton setFrame:CGRectMake(20, self.view.frame.size.height/2-40, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(LoginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
}

- (void)LoginClick {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    if([_username.text  isEqual: @"user1"]) {
        [userDef setValue:@"user1" forKey:@"selfUser"];
        [userDef setValue:@"user2" forKey:@"otherUser"];
        [self toMainView];
    }
    else if([_username.text  isEqual: @"user2"]) {
        [userDef setValue:@"user2" forKey:@"selfUser"];
        [userDef setValue:@"user1" forKey:@"otherUser"];
        [self toMainView];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"用户名错误" message:@"用户名只能输入user1或者user2" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
}
//跳转至主界面
- (void)toMainView {
    UIStoryboard *storboard = self.storyboard;
    ViewController *vc = [storboard instantiateViewControllerWithIdentifier:@"vc"];
    [self presentViewController:vc animated:YES completion:nil];
}

//点击旁边屏幕自动隐藏键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_username resignFirstResponder];
    
}
@end

