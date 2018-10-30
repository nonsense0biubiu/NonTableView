//
//  NonTabAdapter.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NonTabDataBox.h"

/**
 通用适配器，请勿重写，可以继承。
 */
@interface NonTabAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

/**
 弱引用的tableview
 */
@property (weak, nonatomic,readonly) UITableView *nonTableView;

/**
 设置数据，替换已有的数据

 @param nonDatas 遵守协议dataBox的数据
 */
-(void)setNonDatas:(id<NonTabDataBox>)nonDatas;
/**
 绑定UITableview

 @param tableview 传入绑定的tableview
 */
-(void)bindTableView:(UITableView *)tableview;
@end
