//
//  ViewController.m
//  521Travel_Delete
//
//  Created by youngstar on 16/12/7.
//  Copyright © 2016年 521Travel.com. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () 
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label = [[UILabel alloc]initWithFrame:(CGRectMake(50, 50, 200, 30))];
    _label.text = @"显示内容";
    [self.view addSubview:_label];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(100, 200, 100, 30);
    [button setTitle:@"NEXT" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)button
{
    SecondViewController *second = [[SecondViewController alloc]init];
    UINavigationController *secondNC = [[UINavigationController alloc]initWithRootViewController:second];
    [self presentViewController:secondNC animated:YES completion:nil];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // 取出要传递的属性
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
   NSString *textValue = [userDefaults objectForKey:@"textField"];
    if (textValue.length > 0) {
        _label.text = textValue;
    }
    
    // 在适当时刻将其置为空，避免有所干扰
    [userDefaults setObject:nil forKey:@"textField"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
