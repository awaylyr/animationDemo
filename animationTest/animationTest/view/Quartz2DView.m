//
//  Quartz2DView.m
//  animationTest
//
//  Created by 林雅茹 on 15/8/29.
//  Copyright (c) 2015年 linyr. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView
- (void)awakeFromNib
{
    self.clearsContextBeforeDrawing = YES;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
#if 0
    // 1、 取得图形上下文对象
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2、 创建路径对象
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 20, 20);// 起点
    CGPathAddLineToPoint(path, nil, 20, 70);
    CGPathAddLineToPoint(path, nil, 100, 70);
    // 3、 添加路径到图形上下文
    CGContextAddPath(context, path);
    // 4、 设置图形上下文状态属性
    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1); // 设置笔触颜色
    CGContextSetRGBFillColor(context, 1, 0.5, 0.5, 1); // 设置填充色
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);// 顶点样式，（0，0）和（300，100）是顶点
    CGContextSetLineJoin(context, kCGLineJoinRound);// 设置连接点样式 （50，50）是连接点
    CGFloat lengths[2] = {18,9};
    CGContextSetLineDash(context, 0, lengths, 2);// 设置线段样式，虚线从0开始，虚线间隔定义（长度为18的虚线，长度为9的空白），虚线数组元素个数
//    CGColorRef color = [UIColor purpleColor].CGColor;
//    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.8, color);// 设置阴影
    // 5、绘制图像到指定上下文
    CGContextDrawPath(context, kCGPathFillStroke);
    //   填充方式
//        kCGPathFill, 只填充，不绘制边框
//         kCGPathEOFill,奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
//         kCGPathStroke,只有边框
//         kCGPathFillStroke,既有边框又有填充
//         kCGPathEOFillStroke奇偶填充并绘制边框
    // 6、释放对象
    CGPathRelease(path);
    
#else
    // 1、
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    switch (self.viewType) {
        case Quartz2DTypeCircle:{
            CGContextAddEllipseInRect(context, CGRectMake(20, 20, 100, 100));
        }
            break;
        case Quartz2DTypeEllipse:{
            CGContextAddEllipseInRect(context, CGRectMake(20, 20, 120, 80));
        }
            break;
        case Quartz2DTypeRect:{
            CGContextAddRect(context, CGRectMake(20, 20, 150, 150));
        }
            break;
        case Quartz2DTypeArc:{
            CGContextAddArc(context, 100, 100, 50, 0, M_PI_2, 0);
            // 中心点，半径，起止弧度，是否逆时针
        }
            break;
        case Quartz2DTypeQuardCurve:{
            CGContextMoveToPoint(context, 20, 20);
            CGContextAddQuadCurveToPoint(context, 50, 50, 120, 20);// 控制点，结束点
        }
            break;
        case Quartz2DTypeCurve:{
            CGContextMoveToPoint(context, 10, 50);
            CGContextAddCurveToPoint(context, 60, 10, 100, 100, 150, 50);// 控制点1、控制点2、结束点
        }
            break;
        case Quartz2DTypeImage:{
            UIImage *image=[UIImage imageNamed:@"waterCan"];
            //从某一点开始绘制
           // [image drawAtPoint:CGPointMake(10, 10)];
            //绘制到指定的矩形中，注意如果大小不合适会会进行拉伸
            [image drawInRect:CGRectMake(10, 10, 150, 300)];
            //平铺绘制
            //    [image drawAsPatternInRect:CGRectMake(0, 0, 320, 568)];
        }
            break;
        case Quartz2DTypeStr:{
            //绘制到指定的区域内容
            NSString *str=@"Quartz 2D 基础知识：http://donbe.blog.163.com/blog/static/138048021201052093633776/";
            CGRect rect= CGRectMake(10, 10, 150, 300);
            UIFont *font=[UIFont systemFontOfSize:18];//设置字体
            UIColor *color=[UIColor redColor];//字体颜色
            NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];//段落样式
            style.alignment = NSTextAlignmentLeft;
            [str drawInRect:rect withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:style}];
        }
            break;
        default:{
            // 2、
            CGContextMoveToPoint(context, 20, 20);
            CGContextAddLineToPoint(context, 20, 70);
            CGContextAddLineToPoint(context, 70, 70);
        }
            break;
    }
    CGContextClosePath(context);

    // 3、
    [[UIColor redColor] setStroke]; // 设置边框
//    [[UIColor purpleColor] setFill]; // 设置填充色
//    [[UIColor yellowColor] set]; // 设置边框和填充色
    // 4、
    CGContextDrawPath(context, kCGPathStroke);
#endif
}

- (void)setViewType:(Quartz2DType)viewType
{
    _viewType = viewType;
    [self setNeedsDisplay];
}

@end
