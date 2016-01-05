//
//  AddressViewController.m
//  UINavDemo
//
//  Created by 杨海锋 on 15/12/31.
//  Copyright © 2015年 haizi. All rights reserved.
//

#import "AddressViewController.h"
#import "PickerUtil.h"
#import "AddressView.h"

@interface AddressViewController ()<AddressViewDelegate>

@end

@implementation AddressViewController
{
    AddressView *addressView;
    NSDictionary *provinceData;
    NSDictionary *cityData;
    NSDictionary *areaData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    provinceData = @{@"pro1":@"北京市",@"pro2":@"重庆市",@"pro3":@"上海市",@"pro4":@"天津市"};
    cityData = @{
                 @"pro1":@{@"pro1_city1":@"朝阳区",@"pro1_city2":@"海定区"},
                 @"pro2":@{@"pro2_city1":@"渝中区",@"pro2_city2":@"江北区"},
                 @"pro3":@{@"pro3_city1":@"浦东区",@"pro3_city2":@"徐汇区"},
                 @"pro4":@{@"pro4_city1":@"河北区",@"pro4_city2":@"河东区"}
                 };
    areaData = @{
                 @"pro1_city1":@{@"pro1_city1_area1":@"朝阳街道",@"pro1_city1_area2":@"三里屯街道"},
                 @"pro1_city2":@{@"pro1_city2_area1":@"万寿路街道",@"pro1_city2_area2":@"永定路街道"},
                 @"pro2_city1":@{@"pro2_city1_area1":@"解放碑街道",@"pro2_city1_area2":@"七星岗街道"},
                 @"pro2_city2":@{@"pro2_city2_area1":@"观音桥街道",@"pro1_city2_area2":@"华新街街道"},
                 @"pro3_city1":@{@"pro3_city1_area1":@"潍坊新村街道",@"pro3_city1_area2":@"陆家嘴街道"},
                 @"pro3_city2":@{@"pro3_city2_area1":@"天平路街道",@"pro3_city2_area2":@"湖南街道"},
                 @"pro4_city1":@{@"pro4_city1_area1":@"光复道街道",@"pro4_city1_area2":@"望海楼街道"},
                 @"pro4_city2":@{@"pro4_city2_area1":@"大王庄街道",@"pro4_city2_area2":@"大直沽街道"},
                 };

    addressView = [[AddressView alloc] init];
    addressView.delegate = self;
    self.view = addressView;
    
    self.navigationItem.title = @"联动";
    //self.view.backgroundColor = [UIColor grayColor];
}

- (void)showAddressList
{
    PickerUtil *pickerUtil = [[PickerUtil alloc] initWithTitle:nil grade:1 origin:addressView];
    pickerUtil.firstLoadBlock = ^(NSArray *selectedRows, PickerUtilCompletionHandler completionHandler){
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        for (NSDictionary *province in provinceData) {
            [rows addObject:[PickerUtilRow rowWithName:[provinceData objectForKey:province] value:province]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.resultBlock = ^(NSArray *selectedRows) {
        PickerUtilRow *firstRow = [selectedRows objectAtIndex:0];
        NSLog(@"省份是：%@",firstRow.value);
    };
    
    [pickerUtil show];
}

//二级联动
- (void)showTwoPick
{
    PickerUtil *pickerUtil = [[PickerUtil alloc] initWithTitle:nil grade:2 origin:addressView];
    pickerUtil.firstLoadBlock = ^(NSArray *selectedRows, PickerUtilCompletionHandler completionHandler){
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        for (NSDictionary *province in provinceData) {
            [rows addObject:[PickerUtilRow rowWithName:[provinceData objectForKey:province] value:province]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.secondLoadBlock = ^(NSArray *selectedRows,PickerUtilCompletionHandler completionHandler){
        PickerUtilRow *firstRow = [selectedRows objectAtIndex:0];
        NSString *provice = firstRow.value;
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        NSDictionary *cityList = [cityData objectForKey:provice];
        for (NSDictionary *city in cityList) {
            NSLog(@"城市是：%@",city);
            [rows addObject:[PickerUtilRow rowWithName:[cityList objectForKey:city] value:city]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.resultBlock = ^(NSArray *selectedRows) {
        PickerUtilRow *firstRow = [selectedRows objectAtIndex:0];
        PickerUtilRow *secondRow = [selectedRows objectAtIndex:1];
        NSLog(@"省份是：%@ 城市是：%@",firstRow.value,secondRow.value);
    };
    
    [pickerUtil show];
}

- (void)showThreePick
{
    PickerUtil *pickerUtil = [[PickerUtil alloc] initWithTitle:nil grade:3 origin:addressView];
    pickerUtil.firstLoadBlock = ^(NSArray *selectedRows, PickerUtilCompletionHandler completionHandler){
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        for (NSDictionary *province in provinceData) {
            NSLog(@"省份是：%@",province);
            [rows addObject:[PickerUtilRow rowWithName:[provinceData objectForKey:province] value:province]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.secondLoadBlock = ^(NSArray *selectedRows,PickerUtilCompletionHandler completionHandler){
        PickerUtilRow *firstRow = [selectedRows objectAtIndex:0];
        NSString *provice = firstRow.value;
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        NSDictionary *cityList = [cityData objectForKey:provice];
        for (NSDictionary *city in cityList) {
            NSLog(@"城市是：%@",city);
            [rows addObject:[PickerUtilRow rowWithName:[cityList objectForKey:city] value:city]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.thirdLoadBlock = ^(NSArray *selectedRows,PickerUtilCompletionHandler completionHandler){
        PickerUtilRow *secondRow = [selectedRows objectAtIndex:1];
        NSString *city = secondRow.value;
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        NSDictionary *areaList = [areaData objectForKey:city];
        for (NSDictionary *area in areaList) {
            NSLog(@"地区是：%@",area);
            [rows addObject:[PickerUtilRow rowWithName:[areaList objectForKey:area] value:area]];
        }
        completionHandler(rows);
    };
    
    pickerUtil.resultBlock = ^(NSArray *selectedRows) {
        PickerUtilRow *firstRow = [selectedRows objectAtIndex:0];
        PickerUtilRow *secondRow = [selectedRows objectAtIndex:1];
        PickerUtilRow *thirdRow = [selectedRows objectAtIndex:2];
        NSLog(@"省份是：%@ 城市是：%@ 地区是：%@",firstRow.value,secondRow.value,thirdRow.value);
    };
    
    [pickerUtil show];
}


@end
