//
//  bubblethreecell.m
//  multipractice
//
//  Created by 研发部 on 2018/1/14.
//  Copyright © 2018年 development team. All rights reserved.
//

#import "bubblethreecell.h"
#import <Masonry.h>
@implementation bubblethreecell
+(instancetype)cellWithTableView:(UITableView *)tableView{
 static NSString * ID = @"bubblethreecell";
 id cell = [tableView dequeueReusableCellWithIdentifier:ID];
 if (cell==nil) {
  cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
 }
 return cell;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
 if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
  _labelone = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 20)];
  _labelone.textColor = [UIColor blackColor];
  _labelone.text = @"3";
  _labelone.backgroundColor = [UIColor redColor];
  [self addSubview:_labelone];
  
  _labelzimu = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 120, 20)];
  _labelzimu.textColor = [UIColor blackColor];
  _labelzimu.text = @"2345";
  _labelzimu.backgroundColor=[UIColor purpleColor];
  [self addSubview:_labelzimu];
  
 }
 return self;
}

-(void)passmodel:(bubblepassModel *)bubbleModels{
 _labelone.text = bubbleModels.abcdstr;
 _labelzimu.text = bubbleModels.titlestr;
 NSLog(@"输出可变数组的值:%@",bubbleModels.passtotalarray);
}
@end
