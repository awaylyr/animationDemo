//
//  Quartz2DView.h
//  animationTest
//
//  Created by 林雅茹 on 15/8/29.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, Quartz2DType)
{
    Quartz2DTypeDefault = 0,
    Quartz2DTypeCircle ,
    Quartz2DTypeEllipse,
    Quartz2DTypeArc,
    Quartz2DTypeRect,
    Quartz2DTypeQuardCurve,
    Quartz2DTypeCurve,
    Quartz2DTypeStr,
    Quartz2DTypeImage,
};

@interface Quartz2DView : UIView
@property(assign,nonatomic)Quartz2DType viewType;
@end
