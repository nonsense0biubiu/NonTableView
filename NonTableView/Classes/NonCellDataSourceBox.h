//
//  NonCellDataSourceBox.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NonBaseCellBox.h"


/**
 cell的 数据的渲染协议
 */
@protocol NonCellDataSourceBox <NSObject>

/**
 cell内必须重写这个方法

 @param data 遵守数据格式的数据
 */
-(void) configNonData:(id<NonBaseCellBox> ) data;

@end
