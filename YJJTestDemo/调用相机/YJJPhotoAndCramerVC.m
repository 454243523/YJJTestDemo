//
//  YJJPhotoAndCramerVC.m
//  YJJTestDemo
//
//  Created by mac on 2019/12/17.
//  Copyright © 2019 qianpen-Ios. All rights reserved.
//

#import "YJJPhotoAndCramerVC.h"
#import "LYLPhotoTailoringViewController.h"
@interface YJJPhotoAndCramerVC()<UIImagePickerControllerDelegate, UINavigationControllerDelegate,PhotoViewControllerDelegate>
@end
@implementation YJJPhotoAndCramerVC
-(void)viewDidLoad{
    [super viewDidLoad];
}
- (IBAction)goxiangji:(UIButton *)sender {
    // 创建UIImagePickerController实例
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePickerController.delegate = self;
    // 是否显示裁剪框编辑（默认为NO），等于YES的时候，照片拍摄完成可以进行裁剪
//    imagePickerController.allowsEditing = YES;
    // 设置照片来源为相机
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // 设置进入相机时使用前置或后置摄像头
    imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    // 展示选取照片控制器
    [self presentViewController:imagePickerController animated:YES completion:nil];
}
#pragma mark - UIImagePickerControllerDelegate
// 完成图片的选取后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // 选取完图片后跳转回原控制器
//    [picker dismissViewControllerAnimated:YES completion:nil];
    /* 此处参数 info 是一个字典，下面是字典中的键值 （从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     * UIImagePickerControllerMediaType; // 媒体类型
     * UIImagePickerControllerOriginalImage; // 原始图片
     * UIImagePickerControllerEditedImage; // 裁剪后图片
     * UIImagePickerControllerCropRect; // 图片裁剪区域（CGRect）
     * UIImagePickerControllerMediaURL; // 媒体的URL
     * UIImagePickerControllerReferenceURL // 原件的URL
     * UIImagePickerControllerMediaMetadata // 当数据来源是相机时，此值才有效
     */
    // 从info中将图片取出，并加载到imageView当中
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    LYLPhotoTailoringViewController *photoVC = [[LYLPhotoTailoringViewController alloc] init];
        photoVC.oldImage = image;
        photoVC.mode = PhotoMaskViewModeSquare;
        photoVC.cropWidth = CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds);
        photoVC.cropHeight = CGRectGetWidth([UIApplication sharedApplication].keyWindow.bounds);
    //    photoVC.isDark = YES;
        photoVC.delegate = self;
        photoVC.lineColor = [UIColor whiteColor];
        [picker pushViewController:photoVC animated:YES];
//    self.imageView.image = image;
//    // 创建保存图像时需要传入的选择器对象（回调方法格式固定）
//    SEL selectorToCall = @selector(image:didFinishSavingWithError:contextInfo:);
//    // 将图像保存到相册（第三个参数需要传入上面格式的选择器对象）
//    UIImageWriteToSavedPhotosAlbum(image, self, selectorToCall, NULL);
}

// 取消选取调用的方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - PhotoViewControllerDelegate
- (void)imageCropper:(LYLPhotoTailoringViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    [cropperViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imageCropperDidCancel:(LYLPhotoTailoringViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:nil];
}



@end
