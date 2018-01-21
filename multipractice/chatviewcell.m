//
//  chatviewcell.m
//  multipractice
//
//  Created by 研发部 on 2018/1/16.
//  Copyright © 2018年 development team. All rights reserved.
//

#import "chatviewcell.h"
#import <Masonry.h>
@implementation chatviewcell
+(instancetype)cellWithTableView:(UITableView *)tableView{
 static NSString * ID = @"chatviewcell";
 id cell = [tableView dequeueReusableCellWithIdentifier:ID];
 if (cell==nil) {
  cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
 }
 return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
 if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
  UIImage *image = [UIImage imageNamed:@"hongchatzuo"];
  image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.width *0.8];
  _bubbleview = [[UIImageView alloc]initWithImage:image];
  [self addSubview:_bubbleview];
  self.contentLabel = [[UILabel alloc]init];
  self.contentLabel.text = @"1234455fdsfsfdsfsfsdfsdfdsfsdf1234455fdsfsfdsfsfsdfsdfdsfsdf";
  CGRect rec = [self.contentLabel.text boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
  //_bubbleview.frame = CGRectMake(90, 10, 200, 100);
  _bubbleview.frame = CGRectMake(10, 10, rec.size.width+30, rec.size.height+20);
  self.contentLabel.numberOfLines = 0;
  //self.contentLabel.text = _morenstr;
  self.contentLabel.textColor = [UIColor blackColor];
  self.contentLabel.frame = CGRectMake(20, 10, rec.size.width, rec.size.height);
  self.contentLabel.font = [UIFont systemFontOfSize:17.0f];
  [_bubbleview addSubview:self.contentLabel];
  [self addSubview:_bubbleview];
#pragma mark右边
CGFloat youbian=CGRectGetMaxY(_bubbleview.frame);
  UIImage *imageright = [UIImage imageNamed:@"chatyou"];
  UIEdgeInsets insets = UIEdgeInsetsMake(0, 30, 10, 10);
  imageright = [image resizableImageWithCapInsets:insets];
  _rightview = [[UIImageView alloc]initWithImage:imageright];
  [self addSubview:_rightview];
  self.rightLabel = [[UILabel alloc]init];
  self.rightLabel.text = @"AqqqqqqqqqqqqAqqqqqqqqqqqqAqqqqqqqqqqqq";
  CGRect recyou = [self.rightLabel.text boundingRectWithSize:CGSizeMake(200, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
  CGFloat YYSScreenW = [UIScreen mainScreen].bounds.size.width;
  _rightview.frame = CGRectMake(YYSScreenW-250, youbian+20, recyou.size.width+20, recyou.size.height+30);
  self.rightLabel.numberOfLines = 0;
  self.rightLabel.backgroundColor = [UIColor yellowColor];
  self.rightLabel.textColor = [UIColor blackColor];
  self.rightLabel.frame = CGRectMake(20, 0, rec.size.width, rec.size.height);
  self.rightLabel.font = [UIFont systemFontOfSize:17.0f];
  [_rightview addSubview:self.rightLabel];
  [self.rightLabel sizeToFit];
  [self addSubview:_rightview];
  CGFloat height = CGRectGetMaxY(_rightview.frame);
#pragma mark左边
  UIImage *imagetwo = [UIImage imageNamed:@"hongchatzuo"];
  imagetwo = [imagetwo stretchableImageWithLeftCapWidth:imagetwo.size.width/2 topCapHeight:imagetwo.size.width *0.8];
  _bubbleview = [[UIImageView alloc]initWithImage:image];
  _bubbleview.frame = CGRectMake(10, height+10, 200, 100);
  [self addSubview:_bubbleview];
  _bubblethirdview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xiao"]];
  [_bubbleview addSubview:_bubblethirdview];
  [_bubblethirdview mas_makeConstraints:^(MASConstraintMaker *make) {
   make.edges.mas_equalTo(0);
  }];
 }
 return self;
}
@end
