//
//  Item3ViewController.m
//  YJJTestDemo
//
//  Created by qianpen-Ios on 2019/7/8.
//  Copyright © 2019 qianpen-Ios. All rights reserved.
//

#import "Item3ViewController.h"
#import "YJJLoadView.h"
@interface Item3ViewController ()
@property (weak, nonatomic) IBOutlet YJJLoadView *loadview;

@end

@implementation Item3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loadview.type = 0;
    self.loadview.selectBlock = ^(NSInteger type) {
        self.loadview.type++;
    };
    
}

- (IBAction)startAtion:(id)sender {
    self.loadview.type = 3;
}

- (IBAction)stopAtion:(id)sender {
}

@end
