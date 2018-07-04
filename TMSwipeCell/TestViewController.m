//
//  TestViewController.m
//  TMSwipeCell
//
//  Created by cocomanber on 2018/7/3.
//  Copyright © 2018年 cocomanber. All rights reserved.
//

#import "TestViewController.h"
#import "TableViewCellType1.h"
#import "TableViewCellType2.h"

@interface TestViewController ()
<TMSwipeCellDelegate>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView registerClass:[TableViewCellType1 class] forCellReuseIdentifier:@"TableViewCellType1"];
}

/**
 选中了侧滑按钮
 
 @param swipeCell 当前响应的cell
 @param indexPath cell在tableView中的位置
 @param index 选中的是第几个action
 */
- (void)swipeCell:(TMSwipeCell *)swipeCell atIndexPath:(NSIndexPath *)indexPath didSelectedAtIndex:(NSInteger)index
{
    
}

/**
 告知当前位置的cell是否需要侧滑按钮
 
 @param swipeCell 当前响应的cell
 @param indexPath cell在tableView中的位置
 @return YES 表示当前cell可以侧滑, NO 不可以
 */
- (BOOL)swipeCell:(TMSwipeCell *)swipeCell canSwipeRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

/**
 返回侧滑事件
 
 @param swipeCell 当前响应的cell
 @param indexPath cell在tableView中的位置
 @return 数组为空, 则没有侧滑事件
 */
- (nullable NSArray<TMSwipeCellAction *> *)swipeCell:(TMSwipeCell *)swipeCell editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /* 方便组合测试，建议不要这么做.. */
    TMSwipeCellAction *action1 = [TMSwipeCellAction rowActionWithStyle:TMSwipeCellActionStyleNormal title:@"取消关注" handler:^(TMSwipeCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"取消关注");
    }];
    TMSwipeCellAction *action2 = [TMSwipeCellAction rowActionWithStyle:TMSwipeCellActionStyleDestructive title:@"删除" handler:^(TMSwipeCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
    }];
    
    TMSwipeCellAction *tagAction = [TMSwipeCellAction rowActionWithStyle:TMSwipeCellActionStyleNormal title:nil handler:^(TMSwipeCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击的打标签按钮");
    }];
    tagAction.backgroundColor = [UIColor clearColor];
    tagAction.image = [UIImage imageNamed:@"Tag"];
    
    TMSwipeCellAction *deleteAction = [TMSwipeCellAction rowActionWithStyle:TMSwipeCellActionStyleNormal title:nil handler:^(TMSwipeCellAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"点击的删除按钮");
    }];
    deleteAction.backgroundColor = [UIColor clearColor];
    deleteAction.image = [UIImage imageNamed:@"Delete"];
    
    if (indexPath.section == 0) {
        if (indexPath.row % 2 == 0) {
            return @[action2];
        }else{
            return @[action1,action2];
        }
    }else{
        if (indexPath.row % 2 == 0) {
            if (indexPath.row > 2) {
                deleteAction.animationStyle = TMSwipeCellActionAnimationStyleAnimation;
                deleteAction.confirmIcon = @"Delete";
                return @[tagAction, deleteAction];
            }else{
                return @[tagAction, deleteAction];
            }
        }else{
            return @[action1, deleteAction];
        }
    }
}

#pragma mark - tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        TableViewCellType1 *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellType1"];
        cell.delegate = self;
        cell.contentView.backgroundColor = [UIColor orangeColor];
        return cell;
    }
    else
    {
        TableViewCellType2 *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellType2"];
        cell.delegate = self;
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
