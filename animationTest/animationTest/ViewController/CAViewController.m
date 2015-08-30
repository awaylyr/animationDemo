//
//  CAViewController.m
//  animationTest
//
//  Created by 林雅茹 on 15/3/30.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import "CAViewController.h"

@interface CAViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic)CAShapeLayer *layer;



@end

@implementation CAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)removeAnimations:(id)sender {
    [_layer removeAllAnimations];
   
}

- (IBAction)buttonTap:(UIButton *)sender {
  //  [self animationRipple];
    [self animationRotation];
}

// 波纹
- (void)animationRipple
{
    /*往self.button上添加了一个图层，图层的图案是一个环*/
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.button.bounds cornerRadius:(self.button.frame.size.width -20)/ 2];
    _layer = [CAShapeLayer layer];
    _layer.path = path.CGPath;
    _layer.position = [self.button convertPoint:self.button.center fromView:self.view];
    _layer.fillColor = nil;
    _layer.strokeColor = [UIColor orangeColor].CGColor;
    _layer.lineWidth = 5;
    // 一定要设置layer的frame，否则图层的位置会出现在无法预期的地方
    _layer.frame = self.button.bounds;
    [self.button.layer addSublayer:_layer];
    /*往新的图层上添加动画*/
    // 大小
    CABasicAnimation *sizeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    sizeAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    sizeAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(2, 2, 1)];
    //sizeAnimation.duration = 2;
   // [layer addAnimation:sizeAnimation forKey:nil];
    // 透明度
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.fromValue = @1;
    alphaAnimation.toValue = @0;
    // 颜色
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
    colorAnimation.fromValue = (id)[UIColor orangeColor].CGColor;
    colorAnimation.toValue =(id) [UIColor greenColor].CGColor;
    // lineWidth
    CABasicAnimation *widthAnimation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    /*总结:keypath即图层的各个属性*/
    widthAnimation.toValue = @20;
    // 组合动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[sizeAnimation,alphaAnimation,colorAnimation,widthAnimation];
    groupAnimation.duration = 1.5;
    groupAnimation.repeatCount = 5;
    groupAnimation.delegate = self;
  //  groupAnimation.repeatDuration = 0.05;
    [_layer addAnimation:groupAnimation forKey:nil];
    
}

// 旋转
- (void)animationRotation
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:[self.button convertPoint:self.button.center fromView:self.view] radius:(self.button.frame.size.width -20)/ 2 startAngle:- M_PI_2  endAngle:0 clockwise:YES];
    _layer = [CAShapeLayer layer];
    _layer.frame = self.button.bounds;
    _layer.path = path.CGPath;
    _layer.lineCap = kCALineCapRound;
    _layer.lineWidth = 20;
    _layer.fillColor = nil;
    _layer.strokeColor = [UIColor colorWithWhite:1 alpha:0.5].CGColor;
    [self.button.layer addSublayer:_layer];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.duration = 3;
    animation.delegate = self;
    animation.repeatCount = 100;
    animation.toValue = @(M_PI * 2);
    [_layer addAnimation:animation forKey:nil];
    
}
- (void)animationDidStart:(CAAnimation *)anim
{
  
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    /*不可以调用父类方法，会崩溃*/
    _layer.hidden = YES;
    [_layer removeFromSuperlayer];
    // CAAnimation是CABasicAnimation的父类，在此可以通过keypath属性来得到每个动画作用的图层属性，而不是动画的名字。
}
@end
