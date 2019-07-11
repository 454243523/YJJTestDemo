//
//  YJJLoadView.h
//  YJJTestDemo
//
//  Created by qianpen-Ios on 2019/7/8.
//  Copyright © 2019 qianpen-Ios. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJJLoadView : UIView
@property (nonatomic, strong) UIButton *imageBtn;
@property (nonatomic, strong) NSString *image;//图片名称
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) void (^selectBlock)(NSInteger type);
-(void)start;

@end

NS_ASSUME_NONNULL_END
