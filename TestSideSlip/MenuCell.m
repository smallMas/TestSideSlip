//
//  MenuCell.m
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-11.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier NS_AVAILABLE_IOS(3_0) {
//    NSLog(@"%s",__FUNCTION__);
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if(self){
//        cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(26, 0, 294, 44)];
//        cellButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [cellButton setFrame:CGRectMake(0, 10, 25, 24)];
//        [cellButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:cellLabel];
//        [self addSubview:cellButton];
//    }
//    return self;
//}
//
//- (void)configCellData:(TreeViewNote *)aBean {
//    cellLabel.text = aBean.name;
//    if (aBean.isCanExpand) {
//        if (aBean.isExpanded) {
//            [cellButton setBackgroundImage:[UIImage imageNamed:@"Open"] forState:UIControlStateNormal];
//        }else {
//            [cellButton setBackgroundImage:[UIImage imageNamed:@"Close"] forState:UIControlStateNormal];
//        }
//    }
//}
//
//- (void)test {
//    NSLog(@"%s",__FUNCTION__);
//}

- (void)drawRect:(CGRect)rect {
    NSLog(@"%s",__FUNCTION__);
    CGRect cellFrame = self.cellLabel.frame;
    CGRect buttonFrame = self.cellButton.frame;
    int indentation = self.treeNode.nodeLevel * 25;
    cellFrame.origin.x = buttonFrame.size.width + indentation + 5;
    buttonFrame.origin.x = 2 + indentation;
    self.cellLabel.frame = cellFrame;
    self.cellButton.frame = buttonFrame;
}

- (void)setTheButtonBackgroundImage:(UIImage *)backgroundImage {
    [self.cellButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

- (IBAction)expand:(id)sender {
    self.treeNode.isExpanded = !self.treeNode.isExpanded;
    [self setSelected:NO];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"ProjectTreeNodeButtonClicked" object:self];
}
@end
