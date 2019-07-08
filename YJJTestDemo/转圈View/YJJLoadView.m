//
//  YJJLoadView.m
//  YJJTestDemo
//
//  Created by qianpen-Ios on 2019/7/8.
//  Copyright © 2019 qianpen-Ios. All rights reserved.
//

#import "YJJLoadView.h"

@implementation YJJLoadView

-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
-(void)start{
    if (!_imageview) {
        self.imageview = [[UIImageView alloc]init];
        [self.imageview setImage:[UIImage imageNamed:@"play_load"]];
//        self.imageview.backgroundColor = [UIColor redColor];
        [self addSubview:self.imageview];
        [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_offset(50);
            make.center.mas_offset(0);
        }];
        CABasicAnimation *layer = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        layer.toValue = @(2*M_PI);
        layer.duration = 3;
        layer.removedOnCompletion = false;
        layer.repeatCount = MAXFLOAT;
        [self.imageview.layer addAnimation:layer forKey:nil];
    }
//    [self start];
}

@end
