//
//  NonSectionDataBox.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NonBaseCellBox.h"

/**
  section的data协议。
 */
@protocol NonSectionDataBox <NSObject>
@required

/**
 rowdatas的list.注意一定要实现NonBaseCellBox协议哦

 @return 数据
 */
-(NSArray<id<NonBaseCellBox>> *) nonBaseCellListData;
@optional

/**
 section的头部数据

 @return 头部数据
 */
-(id<NonBaseCellBox>) nonBaseHeaderData;

/**
 section的尾部数据

 @return 尾部数据
 */
-(id<NonBaseCellBox>) nonBaseFooterData;

/**
 rows的数量，可重写

 @return 返回cell的数量
 */
-(NSInteger)nonBaseCellNums;
@end
