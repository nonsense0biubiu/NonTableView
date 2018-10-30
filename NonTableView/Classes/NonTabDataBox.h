//
//  NonTabDataBox.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NonSectionDataBox.h"

/**
 整个tab的数据协议
 */
@protocol  NonTabDataBox<NSObject>
@required

/**
 所有的section data

 @return list
 */
-(NSArray<id<NonSectionDataBox>> *) nonSectionListDatas;
@optional

/**
 section的数量，可不写。

 @return section数量
 */
-(NSInteger) nonSectionNum;
@end
