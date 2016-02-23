//
//  WaterfallsFlowView.m
//  UINavDemo
//
//  Created by 杨海锋 on 16/1/18.
//  Copyright © 2016年 haizi. All rights reserved.
//

#import "WaterfallsFlowView.h"
#import "AoiroSoraLayout.h"

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface WaterfallsFlowView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,AoiroSoraLayoutDelegate>

@end

@implementation WaterfallsFlowView
{
    UICollectionView *_collectionView;
    UIView *superView;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    self.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    superView = self;
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        AoiroSoraLayout *layOut = [[AoiroSoraLayout alloc] init];
        layOut.interSpace = 5;
        layOut.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        layOut.colNum = 3;
        layOut.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layOut];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
        [self addSubview:_collectionView];
        
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView.mas_top);
            make.left.equalTo(superView.mas_left);
            make.bottom.equalTo(superView.mas_bottom);
            make.right.equalTo(superView.mas_right);
        }];
    }
    return self;
}

//返回每个item的高度
- (CGFloat)itemHeightLayOut:(AoiroSoraLayout *)layOut indexPath:(NSIndexPath *)indexPath
{
    return arc4random_uniform(100) + 100;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//返回多少个集合
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

//每个item的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
   
    UIButton *button = [[UIButton alloc] init];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor colorWithHexString:@"ffffff"].CGColor;
    button.layer.cornerRadius = 25.0f;
    [button setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cell addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(cell.mas_centerX);
        make.centerY.equalTo(cell.mas_centerY);
        
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    
    return cell;
}

@end
