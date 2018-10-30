//
//  NonBaseCellBox.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Non.h"

/**
 基础的cell的协议。required必须写入。
 */
@protocol NonBaseCellBox <NSObject>
@required

/**
 需要使用的cell的名字，必须准确哦~~

 @return cell文件名字
 */
-(NSString *)nonBaseCellName;

/**
 cell的准确高度，如果用autolayout,可以用UiAutoDemisstion 属性

 @return 返回高度
 */
-(CGFloat)nonBaseCellHeight;

@optional

/**
 分割线的insets,详情请参考 uiview+non.h内

 @return uiedgeinsets
 */
-(UIEdgeInsets)nonBaseCellLineInsets;

/**
 分割线类型 ,详情参考 UIView+Non.h

 @return type
 */
-(NonBaseCellLineType) nonLineType;

/**
 我操，忘了这个方法拿来干嘛的。。。我是谁，我为什么要写这个方法

 @param cellHeight 未知、、、
 */
-(void)setNonBaseCellHeight:(CGFloat) cellHeight; 
@end
