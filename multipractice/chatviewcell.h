//
//  chatviewcell.h
//  multipractice
//
//  Created by 研发部 on 2018/1/16.
//  Copyright © 2018年 development team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chatviewcell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *bubbleview;

@property(nonatomic,strong)UILabel *content2Label;
@property(nonatomic,strong)UIImageView *bubble2view;

@property(nonatomic,strong)UIImageView *rightview;
@property(nonatomic,strong)UIImageView *rightbubleview;
@property(nonatomic,strong)UILabel *rightLabel;

@property(nonatomic,strong)UIView *thirdbubbleview;
//@property(nonatomic,strong)UILabel *thirdbubblelabel;
@property(nonatomic,strong)UIImageView *bubblethirdview;
@end
