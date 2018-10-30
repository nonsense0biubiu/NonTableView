//
//  UITableViewHeaderFooterView+NonBaseCell.h
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NonBaseCellBox.h"
@interface UITableViewHeaderFooterView (NonBaseCell)
@property (strong, nonatomic) id<NonBaseCellBox> nonBaseData;
@end
