//
//  ViewController.m
//  animationTest
//
//  Created by 林雅茹 on 15-1-11.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   /* UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setTitle:@"改变" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 60, 40);
    [button addTarget:self action:@selector(changeUIView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];*/
    UIView *redView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:yellowView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"改变" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 300, 40);
    [button addTarget:self action:@selector(changeUIView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setTitle:@"改变1" forState:UIControlStateNormal];
    button1.frame = CGRectMake(10, 60, 300, 40);
    [button1 addTarget:self action:@selector(changeUIView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeUIView{
  /*  [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    [UIView commitAnimations];*/
    CATransition *transition = [CATransition animation];
    transition.duration = 2.0f;
   // transition.type = kCATransitionReveal;
    transition.type = @"cube";
    //上面这些私有的动画效果，在实际应用中要谨慎使用。因为在app store审核时可能会以为这些动画效果而拒绝通过。
   /* transition.type = @"suckEffect";
    transition.type = @"oglFlip";//不管subType is "fromLeft" or "fromRight",official只有一种效果
    transition.type = @"rippleEffect";
    transition.type = @"pageCurl";
    transition.type = @"pageUnCurl";
    transition.type = @"cameraIrisHollowOpen ";
    transition.type = @"cameraIrisHollowClose ";*/
    transition.subtype = kCATransitionFromTop;
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [self.view.layer addAnimation:transition forKey:@"animation"];
    transition.type = @"cube";
    transition.type = @"suckEffect";
    transition.type = @"oglFlip";//不管subType is "fromLeft" or "fromRight",official只有一种效果
    transition.type = @"rippleEffect";
    transition.type = @"pageCurl";
    transition.type = @"pageUnCurl";
    transition.type = @"cameraIrisHollowOpen ";
    transition.type = @"cameraIrisHollowClose ";
    /*淡化、推挤、揭开、覆盖
     NSString * const kCATransitionFade;
     NSString * const kCATransitionMoveIn;
     NSString * const kCATransitionPush;
     NSString * const kCATransitionReveal;
     这四种，
     transition.subtype
     也有四种
     NSString * const kCATransitionFromRight;
     NSString * const kCATransitionFromLeft;
     NSString * const kCATransitionFromTop;
     NSString * const kCATransitionFromBottom;*/
}

- (void)changeUIView1{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
    //  交换本视图控制器中2个view位置
    [self.view exchangeSubviewAtIndex:1 withSubviewAtIndex:0];
    [UIView commitAnimations];
}

@end
