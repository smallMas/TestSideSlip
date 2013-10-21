//
//  MenuCell.h
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-11.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TreeViewNote.h"

@interface MenuCell : UITableViewCell {
//    UILabel *cellLabel;
//    UIButton *cellButton;
}
//- (void)configCellData:(TreeViewNote *)aBean;

@property (retain, nonatomic) IBOutlet UILabel *cellLabel;
@property (retain, nonatomic) IBOutlet UIButton *cellButton;
@property (retain, strong) TreeViewNote *treeNode;

- (IBAction)expand:(id)sender;
- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage;
@end
