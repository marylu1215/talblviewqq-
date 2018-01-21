//
//  bubblethreecell.h
//  multipractice
//
//  Created by 研发部 on 2018/1/14.
//  Copyright © 2018年 development team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bubbleModel.h"
#import "bubblepassModel.h"
@interface bubblethreecell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)UILabel *labelone;
@property(nonatomic,strong)UILabel *labelzimu;
//-(void)passmodel:(bubbleModel*)bubbleModel;
-(void)passmodel:(bubblepassModel *)bubbleModels;
@end
