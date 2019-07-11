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
    [self.imageBtn.layer removeAllAnimations];
    
    CABasicAnimation *layer = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    layer.toValue = @(2*M_PI);
    layer.duration = 3;
    layer.removedOnCompletion = false;
    layer.repeatCount = MAXFLOAT;
    [self.imageBtn.layer addAnimation:layer forKey:nil];

}
-(void)stop{
    [self.imageBtn.layer removeAllAnimations];
}
-(void)setType:(NSInteger)type{
    _type = type;
    if (_type > 2) {
        _type = 0;
    }
    if (_type == 0) {//暂停播放
        [self.imageBtn setImage:[UIImage imageNamed:@"play_play"] forState:0];
        [self stop];
        self.imageBtn.enabled = YES;
    }else if (_type == 1){
        [self.imageBtn setImage:[UIImage imageNamed:@"play_pause"] forState:0];
        [self stop];
        self.imageBtn.enabled = YES;
    }else{//加载中
        [self.imageBtn setImage:[UIImage imageNamed:@"play_load"] forState:0];
        self.imageBtn.enabled = NO;
        [self start];
    }
    [self.imageBtn layoutIfNeeded];
}
-(void)selectBtnAtion:(UIButton *)btn{
    if (self.selectBlock) {
        self.selectBlock(self.type);
    }
}
-(UIButton *)imageBtn{
    if (!_imageBtn) {
        _imageBtn = [[UIButton alloc]init];
        [_imageBtn setImage:[UIImage imageNamed:@"play_play"] forState:0];
        [self addSubview:_imageBtn];
        [_imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_offset(50);
            make.center.mas_offset(0);
        }];
        [_imageBtn addTarget:self action:@selector(selectBtnAtion:) forControlEvents:UIControlEventTouchUpInside];
        _imageBtn.enabled = NO;
    }
    return _imageBtn;
}
@end
