//
//  chatViewController.m
//  multipractice
//
//  Created by 研发部 on 2018/1/16.
//  Copyright © 2018年 development team. All rights reserved.
//

#import "chatViewController.h"
#import "chatviewcell.h"
@interface chatViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *onetableview;
@end

@implementation chatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 self.view.backgroundColor = [UIColor whiteColor];
 
 _onetableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
 _onetableview.delegate = self;
 _onetableview.dataSource = self;
 [self.view addSubview:_onetableview];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 chatviewcell *viewcell = [chatviewcell cellWithTableView:tableView];
 return viewcell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 return 300;
}
@end
