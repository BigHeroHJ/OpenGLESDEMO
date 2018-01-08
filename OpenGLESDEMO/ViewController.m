//
//  ViewController.m
//  OpenGLESDEMO
//
//  Created by Lemon HOLL on 2018/1/8.
//  Copyright © 2018年 Lemon HOLL. All rights reserved.
//

#import "ViewController.h"
#import "OpenGLViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
  
    NSMutableArray  *_dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:@"OpenGL es2.0 创建视图"];
    
    [_tableview reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentiders"];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row ==0){
        OpenGLViewController * openglVC = [OpenGLViewController new];
        [self.navigationController pushViewController:openglVC animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
