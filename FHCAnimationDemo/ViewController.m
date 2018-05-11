//
//  ViewController.m
//  FHCAnimationDemo
//
//  Created by shouzhi on 2018/5/11.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "ViewController.h"

static NSString * const CellTitleName = @"CellTitleName";
static NSString * const CellClassName = @"CellClassName";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic, retain) NSMutableArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    [self initCellDates];
    [self.view addSubview:self.tableView];
}

- (void)initCellDates {
    [self.dataArray addObject:@{CellTitleName:@"波纹动画-replicator animation",CellClassName:@"CircleReplicatorViewController"}];
}

#pragma mark lazy loading...
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma tableView--delegate
#pragma tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    NSDictionary * cellData = nil;
    if (_dataArray.count > indexPath.row) {
        cellData = [_dataArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [cellData objectForKey:CellTitleName];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary * cellData = nil;
    if (_dataArray.count > indexPath.row) {
        cellData = [_dataArray objectAtIndex:indexPath.row];
        NSString * str = [cellData objectForKey:CellClassName];
        Class class = NSClassFromString(str);
        if ([class isSubclassOfClass:[UIViewController class]]) {
            UIViewController * vc = [[class alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
