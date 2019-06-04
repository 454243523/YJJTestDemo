//
//  Constants.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//通过RGB设置颜色
#define kRGBColor(R,G,B)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kWindowH   [UIScreen mainScreen].bounds.size.height //应用程序的屏幕高度
#define kWindowW    [UIScreen mainScreen].bounds.size.width  //应用程序的屏幕宽度

#define kWindowHFor6(height)   kWindowH*height/1336 //应用程序的屏幕高度
#define kWindowWFor6(width)   kWindowW*width/640  //应用程序的屏幕宽度

#define kActualW(width1)     ([UIScreen mainScreen].bounds.size.width*(width1))/(1080)
#define  kActualH(height1) ([UIScreen mainScreen].bounds.size.height*(height1))/(1920)
#define kAppDelegate ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]

#define YYISiPhoneX [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f&& YYIS_IPHONE
#define YYIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define YYIS_IPHONEPLUS  ([[UIScreen mainScreen] bounds].size.width >= 414.0f)
#define IPHONE_X \
(BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);)
//状态栏高度
#define kStatusBarHeight (CGFloat)(YYISiPhoneX?(44):(20))
// 导航栏高度
#define kNavBarHBelow7 (44)
// 状态栏和导航栏总高度
#define kNavBarHAbove7 (CGFloat)(YYISiPhoneX?(88):(64))
// TabBar高度
#define kTabBarHeight (CGFloat)(YYISiPhoneX?(49+34):(49))
// 顶部安全区域远离高度
#define kTopBarSafeHeight (CGFloat)(YYISiPhoneX?(44):(0))
// 底部安全区域远离高度
#define kBottomSafeHeight (CGFloat)(YYISiPhoneX?(34):(0))
// iPhoneX的状态栏高度差值
#define kTopBarDifHeight (CGFloat)(YYISiPhoneX?(24):(0))

//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(storyboardId, storyboardName)     [[UIStoryboard storyboardWithName:storyboardName bundle:nil] \
instantiateViewControllerWithIdentifier:storyboardId]
//防止循环引用
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//移除iOS7之后，cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}
//去掉UItableview headerview黏性
#define kRemoveTableviewSection(tableview) \
- (void)scrollViewDidScroll:(UIScrollView *)scrollView { \
    if (scrollView == tableview) \
    { \
        CGFloat sectionHeaderHeight = kheightSamll; \
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) { \
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0); \
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) { \
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0); \
        } \
    } \
} \
//表格下划线颜色
#define kCellSeparatorColor(tableView) [tableView setSeparatorColor:[[UIColor whiteColor] colorWithAlphaComponent:0.2]];
//添加边框
#define kBorderWidthAndColor(view,width,color)    view.layer.borderWidth = width;\
view.layer.borderColor = [color CGColor] ;


//颜色
#define kColor666666 [UIColor colorWithHexString:@"#666666"]

//圆角
#define kViewRadius(view,radius) view.layer.cornerRadius = radius;\
view.layer.masksToBounds = YES;
//title字体颜色和大小
#define kTitle(size,color)       [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSForegroundColorAttributeName:[UIColor color]}]

//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
//判断机型
#define UI_IS_IPHONE  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define UI_IS_IPHONE6 (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define UI_IS_IPHONE6PLUS (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
// 开启禁用返回手势
#define kOpenNavPop(open) if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {self.navigationController.interactivePopGestureRecognizer.enabled = open;}

/*=================================通知=================================*/
#define kShowFenlie @"ShowFenlie"
#define kShowMusicInfo @"showinfo"
//下载完成刷新
#define kcompleteDownload @"upDownloadCount"
#define kNotification_AD @"upAD"    //更新广告
#define kCallMusci @"callMusci"     //电话打断回调
#define kRemoveHasLocationMusic @"RemoveHasLocationMusic" //移除已经删除的音乐
//音乐转换通知
#define kUpMisic [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(upMusic) name:@"upmusic" object:nil];
#define kRemoveUpmusic [[NSNotificationCenter defaultCenter]removeObserver:self name:@"upmusic" object:nil];
#define kAddChangeAlbum [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAlbum:) name:@"kChangeAlbum" object:nil];
#define kRemoveChangeAlbum [[NSNotificationCenter defaultCenter]removeObserver:self name:@"kChangeAlbum" object:nil];
#define kCallBreakMusic [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callmusic) name:@"callMusci" object:nil];
#define kRemoveCallBreakMusic [[NSNotificationCenter defaultCenter]removeObserver:self name:@"callMusci" object:nil];
#define kRemoveMusic [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deleteHasRemoveLocation:) name:kRemoveHasLocationMusic object:nil];
#define kRemoveRemoveMusic [[NSNotificationCenter defaultCenter]removeObserver:self name:kRemoveHasLocationMusic object:nil];

/*=================================数据存储=================================*/
/*!
 *  @brief 历史记录
 */

//当前版本
#define kBanBen NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary] return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
/*=================================缓存数据=================================*/


/*=================================常量=================================*/
//广告高度
#define kADModH kWindowW/6.4f
//分割字符串
#define kFGStr @"@fg@"
//表格行高
#define kheightBig YYISiPhoneX?114 : kWindowHFor6(220)
#define kheightSamll YYISiPhoneX?57 : kWindowHFor6(110)
//底部控制播放器高度
#define kBottomMusicH (60+kBottomSafeHeight)
//字体大小
#define kFont_28 28
#define kFont_26 25
#define kFont_24 23
#define kFont_22 21
#define kFont_20 19
#define kSizefont_28 [UIFont systemFontOfSize:kWindowWFor6(28)];
#define kSizefont_26 [UIFont systemFontOfSize:kWindowWFor6(25)];
#define kSizefont_24 [UIFont systemFontOfSize:kWindowWFor6(23)];
#define kSizefont_22 [UIFont systemFontOfSize:kWindowWFor6(21)];
#define kSizefont_20 [UIFont systemFontOfSize:kWindowWFor6(19)];
//提示字体透明度
#define kplaceholderAlpha(view) [view setValue:[[UIColor whiteColor] colorWithAlphaComponent:0.2] forKeyPath:@"_placeholderLabel.textColor"];

//缓存时间
#define kCacheTime 60*60*12

//分享id
#define kSDKID @""
//微信
#define kWX_ID @""
#define kWX_SC @""
//微博
#define kWB_ID @""
#define kWB_SC @""
//QQ
#define kQQ_ID @""
#define kQQ_KEY @""

#endif /* Constants_h */
