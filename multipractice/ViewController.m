//
//  ViewController.m
//  multipractice
//
//  Created by 研发部 on 2017/9/22.
//  Copyright © 2017年 development team. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "NSObject+Netwoking.h"
#import "bubblethreecell.h"
#import "bubbleModel.h"
#import "bubbleinsideModel.h"
#import <MJExtension.h>
#import "bubblethreecell.h"
#import "bubblepassModel.h"
#import "chatViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *bottomBtn;
@property(nonatomic,strong)bubbleinsideModel *insidemodel;
@property(nonatomic,strong)NSMutableArray<bubbleModel *>*bubbleModels;
@property(nonatomic,strong)NSMutableArray<bubbleinsideModel*>*bubbleinsideModels;
@property(nonatomic,strong)bubbleModel *outmodel;
@property(nonatomic,strong)bubblepassModel *passmodel;
@property(nonatomic,strong)NSMutableArray<bubblepassModel *>*bubblepassModels;
@property(nonatomic,strong)NSMutableArray *totalarray;
@property(nonatomic,strong)UIButton *xunhuanbtn;
@property(nonatomic,strong)NSArray *zimuarray;
@property(nonatomic,strong)UIButton *againtestBtn;
@property(nonatomic,assign)NSInteger passa;
@property(nonatomic,strong)NSString *abtest;
@end
static int a=0;
@implementation ViewController
-(NSMutableArray<bubblepassModel*>*)bubblepassModels{
 if (_bubblepassModels==nil) {
  _bubblepassModels = [NSMutableArray array];
 }
 return _bubblepassModels;
}
-(NSMutableArray<bubbleModel*>*)bubbleModels{
 if (_bubbleModels==nil) {
  _bubbleModels = [NSMutableArray array];
 }
 return _bubbleModels;
}
-(NSMutableArray<bubbleinsideModel*>*)bubbleinsideModels{
 if (_bubbleinsideModels==nil) {
  _bubbleinsideModels = [NSMutableArray array];
 }
 return _bubbleinsideModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
 _tableview.delegate = self;
 _tableview.dataSource = self;
 [self.view addSubview:_tableview];
 UIButton *btn = [[UIButton alloc]init];
 btn.backgroundColor = [UIColor redColor];
 [btn addTarget:self action:@selector(clickbtn) forControlEvents:UIControlEventTouchUpInside];
 [btn setTitle:@"确定" forState:UIControlStateNormal];
 [self.view addSubview:btn];
 [btn mas_makeConstraints:^(MASConstraintMaker *make) {
  make.left.mas_equalTo(0);
  make.right.mas_equalTo(0);
  make.bottom.mas_equalTo(0);
  make.height.mas_equalTo(40);
 }];
 NSString *urlstring = @"http://yf.xnetyy.com/PhoneApi/ZtApi/get_test_list";
 NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
 parmas[@"type"]=@7;
 [NSObject POST:urlstring parameters:parmas progress:^(NSProgress *downloadProgress) {
 } completionHandler:^(id responseObj, NSError *error) {
 // NSLog(@"输出响应的值:%@",responseObj);
  NSArray *array = responseObj[@"data"];
  NSMutableArray *modelarray = [NSMutableArray array];
  for (NSDictionary *dic in array) {
    bubbleModel *bModel = [bubbleModel mj_objectWithKeyValues:dic];
   NSArray *array = dic[@"check_answer"];
   bModel.bubblearray = [NSMutableArray array];
   for (NSDictionary *dit in array) {
    bubbleinsideModel *insidemodel = [bubbleinsideModel mj_objectWithKeyValues:dit];
    [bModel.bubblearray addObject:insidemodel.check];
   }
   [modelarray addObject:bModel];
  }
  self.bubbleModels = modelarray;
  [_tableview reloadData];
 }];
 _zimuarray = @[@"A",@"B",@"C",@"D",@"E"];
 
 
 UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
 btn2.backgroundColor = [UIColor redColor];
 [btn2 addTarget:self action:@selector(clickchat) forControlEvents:UIControlEventTouchUpInside];
 [self.view addSubview:btn2];
}
-(void)clickchat{
 //NSLog(@"聊天界面的创建");
 chatViewController *chatview = [[chatViewController alloc]init];
 [self presentViewController:chatview animated:YES completion:nil];
}
-(void)clickbtn{
 a++;
 NSInteger b = a+1;
 NSInteger c = b-2;
 bubbleModel *bmodel = self.bubbleModels[c];
 bubblepassModel *passmodel = [[bubblepassModel alloc]init];
 passmodel.titlestr = bmodel.title;
 passmodel.passtotalarray = bmodel.bubblearray;
 //NSLog(@"输出passtotalarray.countr值:%lu",(unsigned long)passmodel.passtotalarray.count);
 _passa = passmodel.passtotalarray.count;
 _abtest = [NSString stringWithFormat:@"%ld",(long)_passa];
 [_abtest addObserver:self forKeyPath:@"abpass" options:NSKeyValueObservingOptionNew context:nil];
 [self.bubblepassModels addObject:passmodel];
 [_tableview reloadData];
 if (self.bubblepassModels.count !=0) {
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:a+1 inSection:0];
  [_tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
 }
 //创建几个循环按钮
 [self createxunhuanbtn:passmodel.passtotalarray];
}
-(void)createxunhuanbtn:(NSMutableArray *)totalarray{
 _backgroundview = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-70, self.view.frame.size.width, 70)];
 _backgroundview.backgroundColor = [UIColor whiteColor];
 [self.view addSubview:_backgroundview];
 for (int i=0; i <totalarray.count; i++) {
  _xunhuanbtn = [UIButton buttonWithType:UIButtonTypeCustom];
  CGFloat width = [UIScreen mainScreen].bounds.size.width;
  CGFloat btnwidth = (width -15 *5)/4;
  
  _xunhuanbtn = [[UIButton alloc]initWithFrame:CGRectMake(i*(btnwidth+15)+15, 30, btnwidth, 30)];
  [_xunhuanbtn addTarget:self action:@selector(clickxunhuan:) forControlEvents:UIControlEventTouchUpInside];
  _xunhuanbtn.backgroundColor = [UIColor redColor];
  _xunhuanbtn.tag = i+100;
  [_xunhuanbtn setTitle:_zimuarray[i] forState:UIControlStateNormal];
  [_backgroundview addSubview:_xunhuanbtn];
 }
}
-(void)clickxunhuan:(UIButton *)sender{
 UIButton *btn = sender;
 NSString *titletext = btn.titleLabel.text;
 a++;
 NSInteger b = a+1;
 NSInteger c = b-2;
 NSInteger d = a;
 NSInteger e = a-1;
 bubbleModel *bmodel = self.bubbleModels[c];
 bubblepassModel *passmodel = [[bubblepassModel alloc]init];
 passmodel.abcdstr = titletext;
 passmodel.titlestr = bmodel.title;
 passmodel.passtotalarray = bmodel.bubblearray;
 _passa = passmodel.passtotalarray.count;
 _passa = passmodel.passtotalarray.count;
 _abtest = [NSString stringWithFormat:@"%ld",(long)_passa];
 [_abtest addObserver:self forKeyPath:@"abpass" options:NSKeyValueObservingOptionNew context:nil];
 [self.bubblepassModels addObject:passmodel];
 [_tableview reloadData];
 if (self.bubblepassModels.count !=0) {
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:a+1 inSection:0];
  [_tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
 }
 //通知主线程刷新
 if (d==self.bubbleModels.count) {
  bubblepassModel *passmodel = [[bubblepassModel alloc]init];
  passmodel.abcdstr = titletext;
  passmodel.titlestr = @"正在为你分析结果";
  [self.bubblepassModels addObject:passmodel];
  [_tableview reloadData];
  if (self.bubblepassModels.count !=0) {
   NSIndexPath *indexPath = [NSIndexPath indexPathForRow:a+2 inSection:0];
   [_tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
   dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
   dispatch_after(delayTime, dispatch_get_main_queue(), ^{
    [self huoqudefen];
   });
   
   for (int i=0; i < 4; i++) {
  _xunhuanbtn = (UIButton *)[[sender superview]viewWithTag:100 + i];
    [_xunhuanbtn setEnabled:NO];
    _xunhuanbtn.hidden = YES;
  #pragma mark创建再测一次按钮
     dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
     _againtestBtn = [[UIButton alloc]init];
     _againtestBtn.backgroundColor = [UIColor redColor];
     [_againtestBtn setTitle:@"再测一次" forState:UIControlStateNormal];
     [_againtestBtn addTarget:self action:@selector(clickagainst) forControlEvents:UIControlEventTouchUpInside];
     [_backgroundview addSubview:_againtestBtn];
     [_againtestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
      //make.left.mas_equalTo(0)
      make.left.mas_equalTo(0);
      make.right.mas_equalTo(0);
      make.bottom.mas_equalTo(0);
      make.height.mas_equalTo(50);
     }];
    });
   
   }
  }
 }
}
-(void)huoqudefen{
 NSString *defen = @"http://yf.xnetyy.com/PhoneApi/ZtApi/get_test_result";
 NSMutableDictionary *parmas = [NSMutableDictionary dictionary];
 parmas[@"type"]=@7;
 [NSObject POST:defen parameters:parmas progress:^(NSProgress *downloadProgress) {
  
 } completionHandler:^(id responseObj, NSError *error) {
  NSDictionary *dic = responseObj[@"data"];
  bubblepassModel *passmodel = [[bubblepassModel alloc]init];
  passmodel.titlestr = dic[@"message"];
  [self.bubblepassModels addObject:passmodel];
  [_tableview reloadData];
  if (self.bubblepassModels.count !=0) {
   NSIndexPath *indexPath = [NSIndexPath indexPathForRow:a+3 inSection:0];
   [_tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
  }
 }];
}
-(void)clickagainst{
 //NSLog(@"点击再测一次");
 [self.bubblepassModels removeAllObjects];
 [_tableview reloadData];
 _backgroundview.hidden = YES;
 a=0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 //NSLog(@"输出self.bubblepassmodel.coutn:%lu",(unsigned long)self.bubblepassModels.count);
 return 2+self.bubblepassModels.count;
 
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 if (indexPath.row==0) {
  UITableViewCell *viewcell = [UITableViewCell new];
  return viewcell;
 }else if (indexPath.row==1){
  UITableViewCell *viewcell = [UITableViewCell new];
  return viewcell;
 }
 bubblethreecell *threecell = [bubblethreecell cellWithTableView:tableView];
 threecell.selectionStyle = UITableViewCellSelectionStyleNone;
 threecell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
 bubblepassModel *passmodel = self.bubblepassModels[indexPath.row-2];
 [threecell passmodel:passmodel];
 return threecell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 return 250;
}

@end
