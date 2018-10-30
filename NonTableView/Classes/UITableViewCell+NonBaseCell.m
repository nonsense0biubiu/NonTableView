//
//  UITableViewCell+NonBaseCell.m
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import "UITableViewCell+NonBaseCell.h"
#import <objc/runtime.h>
#import "NonCellDataSourceBox.h"

static NSString * const kNonDataKey = @"kNonDataKey";
@implementation UITableViewCell (NonBaseCell)

- (void)setNonBaseData:(id<NonBaseCellBox>)nonBaseData
{
    objc_setAssociatedObject(self, (__bridge const void * _Nonnull)(kNonDataKey), nonBaseData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if ([self conformsToProtocol:@protocol(NonCellDataSourceBox)]) {
        [((id<NonCellDataSourceBox>) self) configNonData:nonBaseData];
    }
}


-(id<NonBaseCellBox>)nonBaseData
{
    return objc_getAssociatedObject(self, (__bridge const void * _Nonnull)(kNonDataKey));
}
@end 
