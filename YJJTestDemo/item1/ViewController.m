//
//  ViewController.m
//  YJJTestDemo
//
//  Created by qianpen-Ios on 2019/2/20.
//  Copyright © 2019 qianpen-Ios. All rights reserved.
//

#import "ViewController.h"
#import "XXTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    XXTextView *xx = [[XXTextView alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    xx.xx_placeholder = @"aslkjalgdf";
    [self.view addSubview:xx];
}


@end
