//
//  bubbleModel.h
//  multipractice
//
//  Created by 研发部 on 2018/1/14.
//  Copyright © 2018年 development team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "bubbleinsideModel.h"
@interface bubbleModel : NSObject
@property(nonatomic,strong)NSString *check_answer;
@property(nonatomic,strong)NSString *fengmian;
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *abcdstr;
@property(nonatomic,strong)NSMutableArray *bubblearray;
@property(nonatomic,strong)bubbleinsideModel *insideModel;

@end
