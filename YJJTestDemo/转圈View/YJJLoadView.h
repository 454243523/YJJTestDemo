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
@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) NSString *image;//图片名称


-(void)start;

@end

NS_ASSUME_NONNULL_END
