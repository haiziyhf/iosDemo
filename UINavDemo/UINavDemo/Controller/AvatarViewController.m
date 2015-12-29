//
//  AvatarViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/28.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "AvatarViewController.h"
#import "AvatarView.h"

@interface AvatarViewController ()<AvatarViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation AvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AvatarView *viewController = [[AvatarView alloc] init];
    viewController.delegate = self;
    self.view = viewController;
    
    self.navigationItem.title = @"个人资料";
}

- (void)actionAvatar
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //sheet.preferredStyle = UIAlertControllerStyleActionSheet;
    //检查相机是否可用
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] == YES) {
        [alertController addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"拍照")
            [self uploadAvatar:@"camera"];
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            NSLog(@"点击了从相册选择");
            [self uploadAvatar:@"photo"];
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    } else {
        [alertController addAction:[UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            NSLog(@"点击了从相册选择");
            [self uploadAvatar:@"photo"];
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)actionNickname
{

}

- (void)actionSex
{

}

- (void)uploadAvatar:(NSString *)clickName
{
    NSUInteger sourceType = 0;
    //检查相机是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES) {
        if ([@"camera" isEqualToString:clickName]) {
            sourceType = UIImagePickerControllerSourceTypeCamera;
        } else if ([@"photo" isEqualToString:clickName]) {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    } else {
        sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    picker.allowsEditing = NO;
    
    [self presentViewController:picker animated:YES completion:^(void){}];
}

//上传图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

@end
