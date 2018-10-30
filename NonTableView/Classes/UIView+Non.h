//
//  UIView+Non.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#pragma mark ------------线条类型--------------
typedef NS_ENUM(NSInteger,NonBaseCellLineType){
    LeftLineType = 0,      // 左边有线
    RightLineType = 1,      // 右边有线
    TopLineType = 2,      // 上面有线
    BottomLineType = 3,      // 下面有线
    NoneLineType = 4      // 无横线
};



@interface UIView (Non)
-(void) non_showLeftLinewithInsets:(UIEdgeInsets)insets;
-(void) non_showRightLinewithInsets:(UIEdgeInsets)insets;
-(void) non_showTopLinewithInsets:(UIEdgeInsets)insets;
-(void) non_showBottomLinewithInsets:(UIEdgeInsets)insets;
-(void) non_showLinewithInsets:(UIEdgeInsets)insets withLineType:(NonBaseCellLineType) type;
-(void) non_showLine:(NonBaseCellLineType) type withInsets:(UIEdgeInsets) insets withColor:(UIColor *) color;

@property (strong, nonatomic) UIView * non_lineView;
@end
