//
//  NonTabAdapter.m
//  lsfbdemo
//
//  Created by MAC on 2018/9/14.
//  Copyright © 2018年 Nonsense. All rights reserved.
//

#import "NonTabAdapter.h"
#import "UITableViewCell+NonBaseCell.h"
#import "UIView+Non.h"

@interface NonTabAdapter()
@property (weak, nonatomic,readwrite) UITableView *nonTableView;
@property (strong, nonatomic) id<NonTabDataBox> nonDatas;
@property (strong, nonatomic) NSMutableDictionary * nonIDFDic;
@end

@implementation NonTabAdapter

#pragma mark - lazyLoad dic

-(NSMutableDictionary *)nonIDFDic
{
    if (!_nonIDFDic) {
        _nonIDFDic= [NSMutableDictionary new];
    }
    return _nonIDFDic;
}

-(void)setNonDatas:(id<NonTabDataBox>)nonDatas
{
    _nonDatas=nonDatas;
    if (_nonTableView) {
        [self p_registerCell:_nonTableView];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.nonDatas.nonSectionListDatas[indexPath.section].nonBaseCellListData[indexPath.row].nonBaseCellName forIndexPath:indexPath];
    id<NonBaseCellBox> basedata=self.nonDatas.nonSectionListDatas[indexPath.section].nonBaseCellListData[indexPath.row];
    if ([basedata respondsToSelector:@selector(nonBaseCellLineInsets)] && [basedata respondsToSelector:@selector(nonLineType)]) {
        [cell non_showLinewithInsets:basedata.nonBaseCellLineInsets withLineType:basedata.nonLineType];
    }
    cell.nonBaseData=self.nonDatas.nonSectionListDatas[indexPath.section].nonBaseCellListData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.nonDatas.nonSectionListDatas[indexPath.section].nonBaseCellListData[indexPath.row].nonBaseCellHeight;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.nonDatas) {
        if ([self.nonDatas respondsToSelector:@selector(nonSectionNum)]) {
            return self.nonDatas.nonSectionNum;
        }
        else if(self.nonDatas.nonSectionListDatas && self.nonDatas.nonSectionListDatas.count>0)
        {
            return self.nonDatas.nonSectionListDatas.count;
        }
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.nonDatas && self.nonDatas.nonSectionListDatas && self.nonDatas.nonSectionListDatas.count>0) {
        if ([self.nonDatas.nonSectionListDatas[section]respondsToSelector:@selector(nonBaseCellNums)]) {
            return  self.nonDatas.nonSectionListDatas[section].nonBaseCellNums;
        }
        else if(self.nonDatas.nonSectionListDatas[section].nonBaseCellListData &&  self.nonDatas.nonSectionListDatas[section].nonBaseCellListData.count>0)
        {
            return self.nonDatas.nonSectionListDatas[section].nonBaseCellListData.count;
        }
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.nonDatas && self.nonDatas.nonSectionListDatas.count>0 && [self.nonDatas.nonSectionListDatas[section] respondsToSelector:@selector(nonBaseHeaderData)]) {
        return  self.nonDatas.nonSectionListDatas[section].nonBaseHeaderData.nonBaseCellHeight;
    }
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.nonDatas && self.nonDatas.nonSectionListDatas.count>0 && [self.nonDatas.nonSectionListDatas[section] respondsToSelector:@selector(nonBaseFooterData)]) {
        return self.nonDatas.nonSectionListDatas[section].nonBaseFooterData.nonBaseCellHeight;
    }
    return 0.001f;
}
-(UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.nonDatas && self.nonDatas.nonSectionListDatas.count>0 && [self.nonDatas.nonSectionListDatas[section] respondsToSelector:@selector(nonBaseHeaderData)]) {
        NSString * viewName=self.nonDatas.nonSectionListDatas[section].nonBaseHeaderData.nonBaseCellName;
        if (viewName && [self.nonIDFDic objectForKey:viewName]) {
            
            UITableViewHeaderFooterView *header= [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewName];
            if (header) {
                return header;
            }
        }
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.nonDatas && self.nonDatas.nonSectionListDatas.count>0 && [self.nonDatas.nonSectionListDatas[section] respondsToSelector:@selector(nonBaseFooterData)]) {
        NSString * viewName=self.nonDatas.nonSectionListDatas[section].nonBaseFooterData.nonBaseCellName;
        if (viewName && [self.nonIDFDic objectForKey:viewName]) {
            
            UITableViewHeaderFooterView *footer= [tableView dequeueReusableHeaderFooterViewWithIdentifier:viewName];
            if (footer) {
                return footer;
            }
        }
    }
    return nil;
}

-(void)p_registerCell:(UITableView *) tableview {
    if (self.nonDatas && self.nonDatas.nonSectionListDatas.count>0) { //判断tab的section数据是否存在
        
        for (id<NonSectionDataBox> section in self.nonDatas.nonSectionListDatas) {
            
            if (section ) { //判断row的数据是否存在
                
                if ([section respondsToSelector:@selector(nonBaseHeaderData)] && section.nonBaseHeaderData.nonBaseCellName && ![self.nonIDFDic objectForKey:section.nonBaseHeaderData.nonBaseCellName]) { //注册header
                    Class cellClass=NSClassFromString(section.nonBaseHeaderData.nonBaseCellName);
                    if ([cellClass respondsToSelector:@selector(initWithReuseIdentifier:)]) {
                        [tableview registerClass:cellClass forHeaderFooterViewReuseIdentifier:section.nonBaseHeaderData.nonBaseCellName];
                    }
                    else
                    {
                        [tableview  registerNib:[UINib nibWithNibName:section.nonBaseHeaderData.nonBaseCellName bundle:nil] forHeaderFooterViewReuseIdentifier:section.nonBaseHeaderData.nonBaseCellName];
                    }
                    
                    [self.nonIDFDic setObject:@"1" forKey:section.nonBaseHeaderData.nonBaseCellName];
                }
                
                if ([section respondsToSelector:@selector(nonBaseFooterData)] && section.nonBaseFooterData.nonBaseCellName && ![self.nonIDFDic objectForKey:section.nonBaseFooterData.nonBaseCellName]) { //注册footer
                    Class cellClass=NSClassFromString(section.nonBaseFooterData.nonBaseCellName);
                    if ([cellClass respondsToSelector:@selector(initWithReuseIdentifier:)]) {
                        [tableview registerClass:cellClass forHeaderFooterViewReuseIdentifier:section.nonBaseFooterData.nonBaseCellName];
                    }
                    else
                    {
                        [tableview  registerNib:[UINib nibWithNibName:section.nonBaseFooterData.nonBaseCellName bundle:nil] forHeaderFooterViewReuseIdentifier:section.nonBaseFooterData.nonBaseCellName];
                    }
                    
                    [self.nonIDFDic setObject:@"1" forKey:section.nonBaseFooterData.nonBaseCellName];
                }
                
                
                if (section.nonBaseCellListData.count>0) { //注册cell
                    for (id<NonBaseCellBox> cell in section.nonBaseCellListData) {
                        if (cell && cell.nonBaseCellName && ![self.nonIDFDic objectForKey:cell.nonBaseCellName]) { //判断是否有效
                            Class cellClass=NSClassFromString(cell.nonBaseCellName);
                            if ( [cellClass respondsToSelector:@selector(initWithStyle:reuseIdentifier:)]) {
                                [tableview registerClass:cellClass forCellReuseIdentifier:cell.nonBaseCellName];
                            }
                            else
                            {
                                [tableview registerNib:[UINib nibWithNibName:cell.nonBaseCellName bundle:nil] forCellReuseIdentifier:cell.nonBaseCellName];
                            }
                            [self.nonIDFDic setObject:@"1" forKey:cell.nonBaseCellName];
                        }
                    }
                }
            }
        }
}
}

-(void)bindTableView:(UITableView *)tableview
{
    self.nonTableView=tableview;
    [self p_registerCell:tableview];
        tableview.delegate=self;
        tableview.dataSource=self;
    }

@end
