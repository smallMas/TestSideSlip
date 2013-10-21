//
//  LeftMenuController.m
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-10.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import "LeftMenuController.h"
#import "TreeViewNote.h"
#import "MenuCell.h"

@interface LeftMenuController ()
- (void)fillDisplayArray;
- (void)fillSecondDisplay:(NSArray *)aSecondList;
@end

@implementation LeftMenuController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 320, 20)];
    headerLabel.text = @"首页";
    headerLabel.font = [UIFont boldSystemFontOfSize:17];
    [headerView addSubview:headerLabel];
    menuTable.tableHeaderView = headerView;
    
    // 数组
    menuList = [[NSMutableArray alloc] init];
    noteList = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        TreeViewNote *firstNote = [[TreeViewNote alloc] init];
        firstNote.nodeLevel = 0;
        firstNote.name = [NSString stringWithFormat:@"Section %d",i];
        firstNote.isExpanded = NO;
        firstNote.isCanExpand = YES;
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int j = 0; j < 10; j++) {
            TreeViewNote *secondNote = [[TreeViewNote alloc] init];
            secondNote.nodeLevel = 1;
            secondNote.name = [NSString stringWithFormat:@"%d-%d",i,j];
            secondNote.isExpanded = NO;
            secondNote.isCanExpand = NO;
            [array addObject:secondNote];
        }
        firstNote.secondNoteArray = array;
        [noteList addObject:firstNote];
    }
    
    [self fillDisplayArray];
}

- (void)fillDisplayArray {
    [menuList removeAllObjects];
    for (TreeViewNote *note in noteList) {
        [menuList addObject:note];
        if (note.isExpanded) {
            [self fillSecondDisplay:note.secondNoteArray];
        }
    }
    [menuTable reloadData];
}

- (void)fillSecondDisplay:(NSArray *)aSecondList {
    for (TreeViewNote *note in aSecondList) {
        [menuList addObject:note];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menuList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierCell = @"menuCell";
    MenuCell *cell = (MenuCell *)[tableView dequeueReusableCellWithIdentifier:identifierCell];
    if(cell == nil){
        NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:self options:nil];
        for (id oneObject in nibs) {
            if ([oneObject isKindOfClass:[MenuCell class]]) {
                cell = (MenuCell *)oneObject;
            }
        }
    }
    NSInteger row = [indexPath row];
    TreeViewNote *note = [menuList objectAtIndex:row];
    cell.treeNode = note;
    cell.cellLabel.text = note.name;
    if (note.isCanExpand) {
        [cell.cellButton addTarget:self action:@selector(openChildMenu:) forControlEvents:UIControlEventTouchUpInside];
        cell.cellButton.tag = row;
    }
    if (note.isCanExpand) {
        if (note.isExpanded) {
            [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"Open"]];
        }else {
            [cell setTheButtonBackgroundImage:[UIImage imageNamed:@"Close"]];
        }
    }
    [cell setNeedsDisplay];
    
    
//    static NSString *identifierCell = @"menuCell";
//    MenuCell *cell = (MenuCell *)[tableView dequeueReusableCellWithIdentifier:identifierCell];
//    if(cell == nil){
//        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierCell];
//    }
//    NSInteger row = [indexPath row];
//    TreeViewNote *node = [menuList objectAtIndex:row];
//    [cell configCellData:node];
//    [cell setNeedsDisplay];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    TreeViewNote *note = [menuList objectAtIndex:row];
    if (note.nodeLevel == 0) {
        if (!note.isExpanded) {
            // 只能打开一个menu下拉
            for (TreeViewNote *tempNote in menuList) {
                if (tempNote != note) {
                    tempNote.isExpanded = NO;
                }
            }
        }
        note.isExpanded = !note.isExpanded;
        [self fillDisplayArray];
    }else {
        
    }
}

- (void)openChildMenu:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger index = button.tag;
    TreeViewNote *note = [menuList objectAtIndex:index];
    if (!note.isExpanded) {
        // 只能打开一个menu下拉
        for (TreeViewNote *tempNote in menuList) {
            if (tempNote != note) {
                tempNote.isExpanded = NO;
            }
        }
    }
    note.isExpanded = !note.isExpanded;
    [self fillDisplayArray];
}
@end
