//
//  Quartz2DViewController.m
//  animationTest
//
//  Created by 林雅茹 on 15/8/29.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import "Quartz2DViewController.h"
#import "Quartz2DView.h"

@interface Quartz2DViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet Quartz2DView *Quartz2DView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation Quartz2DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.Quartz2DView.viewType = Quartz2DTypeStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    switch (indexPath.row ) {
        case Quartz2DTypeDefault:
            cell.textLabel.text = @"默认";
            break;
        case Quartz2DTypeArc:
            cell.textLabel.text = @"弧线";
            break;
         case Quartz2DTypeCircle:
            cell.textLabel.text = @"圆";
            break;
        case Quartz2DTypeCurve:
            cell.textLabel.text = @"三次曲线";
            break;
        case Quartz2DTypeEllipse:
            cell.textLabel.text = @"椭圆";
            break;
        case Quartz2DTypeQuardCurve:
            cell.textLabel.text = @"二次曲线";
            break;
        case Quartz2DTypeRect:
            cell.textLabel.text = @"矩形";
            break;
        case Quartz2DTypeStr:
            cell.textLabel.text = @"文字";
            break;
        case Quartz2DTypeImage:
            cell.textLabel.text = @"图片";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case Quartz2DTypeArc:
            self.Quartz2DView.viewType = Quartz2DTypeArc;
            break;
        case Quartz2DTypeCircle:
            self.Quartz2DView.viewType = Quartz2DTypeCircle;
            break;
        case Quartz2DTypeCurve:
             self.Quartz2DView.viewType = Quartz2DTypeCurve;
            break;
        case Quartz2DTypeEllipse:
           self.Quartz2DView.viewType = Quartz2DTypeEllipse;
            break;
        case Quartz2DTypeQuardCurve:
            self.Quartz2DView.viewType = Quartz2DTypeQuardCurve;
            break;
        case Quartz2DTypeRect:
             self.Quartz2DView.viewType = Quartz2DTypeRect;
            break;
        case Quartz2DTypeStr:
            self.Quartz2DView.viewType = Quartz2DTypeStr;
            break;
        case Quartz2DTypeImage:
            self.Quartz2DView.viewType = Quartz2DTypeImage;
            break;
        default:
            self.Quartz2DView.viewType = Quartz2DTypeDefault;
            break;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
