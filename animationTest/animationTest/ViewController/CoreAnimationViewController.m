//
//  CoreAnimationViewController.m
//  animationTest
//
//  Created by 林雅茹 on 15/8/30.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import "CoreAnimationViewController.h"
#import "Quartz2DView.h"

@interface CoreAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) Quartz2DView *animationView;
@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - animation
- (void)keyframeAnimationTest
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation  animationWithKeyPath:@"position"];// 图层的属性
    // 1、运动轨迹
    // 默认CAKeyframeAnimation的path属性为空，如果同时设置了path和values，values会被path覆盖
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 10, 10);
    CGPoint points[2] = {CGPointMake(200, 10),CGPointMake(200, 350)};
    CGPathAddLines(path, nil, points, 2);
    animation.path = path;
    CGPathRelease(path);
    
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(10, 10)],[NSValue valueWithCGPoint:CGPointMake(100, 10)],[NSValue valueWithCGPoint:CGPointMake(100, 100)]];
    // 2、动画时间
    animation.duration = 5;// 持续时间
   // animation.keyTimes = @[@0,@0.5,@1];// 每一个关键帧的时间，默认值为duration / （帧数 - 1）。keyTimes的值的设置与calculationMode有关
    animation.calculationMode = kCAAnimationPaced;
//    kCAAnimationLinear 线性连续变化 ,此时keyTimes数组的值，第一个必须为0，最后一个必须为1
//    kCAAnimationDiscrete 离散变化，只有关键帧的状态，没有中间过程，此时keyTimes数组的值，第一个必须为0
//    kCAAnimationPaced，此时keyTimes的设置无效
//    kCAAnimationCubic，此时keyTimes的设置无效
//    kCAAnimationCubicPaced，此时keyTimes的设置无效
//    如果keyTimes的值不合法，就会被忽略
   // 3、其他属性
    animation.autoreverses = NO;// 是否会到原位
    [self.animationView.layer  addAnimation:animation forKey:nil];// 调用addAnimation动画开始
    
}

- (void)basicAnimationTest
{}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)
tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"CABasicAnimationTest";
            break;
        case 1:
            cell.textLabel.text = @"CAKeyframeAnimationTest";
            break;
        case 2:
            cell.textLabel.text = @"CABasicAnimationTest";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self keyframeAnimationTest];
}

#pragma mark - getters and setters
- (Quartz2DView *)animationView
{
    if (!_animationView) {
        _animationView = [[Quartz2DView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
        _animationView.viewType = Quartz2DTypeImage;
        [self.containerView addSubview:_animationView];
    }
    return _animationView;
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
