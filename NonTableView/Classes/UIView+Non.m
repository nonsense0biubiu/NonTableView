//
//  UIView+Non.m
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import "UIView+Non.h"
#import <objc/runtime.h>
#import "UIColor+Non.h"
#define ColorStr(urlstr) [UIColor non_ColorGetHex:urlstr]

@implementation UIView (Non)
//动态交换方法
+(void)load
{
    Method originMethod= class_getClassMethod(self, @selector(prepareForReuse));
    Method newMethod= class_getClassMethod(self, @selector(non_prepareForReuse));
    method_exchangeImplementations(originMethod, newMethod);
}
//动态添加属性
- (void)setNon_lineView:(UIView *)non_lineView
{
      objc_setAssociatedObject(self, @"fz_lineView",non_lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//动态添加属性
-(UIView *)non_lineView
{
    return objc_getAssociatedObject(self, @"fz_lineView");
}





-(void) non_showLeftLinewithInsets:(UIEdgeInsets)insets{
    [self non_showLine:LeftLineType withInsets:insets withColor:ColorStr(@"E4E4E4")];
}
-(void) non_showRightLinewithInsets:(UIEdgeInsets)insets{
    [self non_showLine:RightLineType withInsets:insets withColor:ColorStr(@"E4E4E4")];
}

-(void) non_showTopLinewithInsets:(UIEdgeInsets)insets{
    [self non_showLine:TopLineType withInsets:insets withColor:ColorStr(@"E4E4E4")];
}

-(void) non_showBottomLinewithInsets:(UIEdgeInsets)insets{
    [self non_showLine:BottomLineType withInsets:insets withColor:ColorStr(@"E4E4E4")];
}
-(void) non_showLinewithInsets:(UIEdgeInsets)insets withLineType:(NonBaseCellLineType) type{
    [self non_showLine:type withInsets:insets withColor:ColorStr(@"E4E4E4")];
}

-(void) non_showLine:(NonBaseCellLineType) type withInsets:(UIEdgeInsets) insets withColor:(UIColor *) color
{
    
    
    self.non_lineView=[UIView new];
    
    self.non_lineView.backgroundColor=color;
    [self addSubview:self.non_lineView];
    [self.non_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        switch (type) {
            case LeftLineType:
            {
                make.width.mas_equalTo(@0.5);
                make.left.equalTo(self.mas_left).inset(insets.left);
                make.top.equalTo(self.mas_top).inset(insets.top);
                make.bottom.equalTo(self.mas_bottom).inset(insets.bottom);
            }
                break;
            case RightLineType:
            {
                make.width.mas_equalTo(@0.5);
                make.right.equalTo(self.mas_right).inset(insets.right);
                make.top.equalTo(self.mas_top).inset(insets.top);
                make.bottom.equalTo(self.mas_bottom).inset(insets.bottom);
            }
                break;
            case TopLineType:
            {
                make.height.mas_equalTo(@0.5);
                make.right.equalTo(self.mas_right).inset(insets.right);
                make.left.equalTo(self.mas_left).inset(insets.left);
                make.top.equalTo(self.mas_top).inset(insets.top);
            }
                break;
            case BottomLineType:
            {
                make.height.mas_equalTo(@0.5);
                make.right.equalTo(self.mas_right).inset(insets.right);
                make.left.equalTo(self.mas_left).inset(insets.left);
                make.bottom.equalTo(self.mas_bottom).inset(insets.bottom);
            }
                break;
            default:
                break;
        }
    }];
}

#pragma mark - 这个方法只能由[self prepareForReuse] 调用
-(void)non_prepareForReuse
{
    [self non_prepareForReuse];
    if (self.non_lineView) {
        [self.non_lineView removeFromSuperview];
    }
}
@end
