//
//  TreeViewNote.h
//  TestSideSlip
//
//  Created by 琥珀先知 on 13-9-11.
//  Copyright (c) 2013年 琥珀先知. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeViewNote : NSObject

@property (nonatomic,strong) NSString *name; // 这个分支的名字
@property (nonatomic,assign) NSInteger nodeLevel; // 分支等级
@property (nonatomic,strong) NSArray *secondNoteArray; // 下一个分支的数组
@property (nonatomic,assign) BOOL isExpanded;  // 判断这个note是否已经扩展了
@property (nonatomic,assign) BOOL isCanExpand; // 判断这个note是否可以扩展
@end
