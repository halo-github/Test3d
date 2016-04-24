//
//  ViewController.m
//  Test3d
//
//  Created by 刘峰 on 16/4/16.
//  Copyright © 2016年 halovv. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.img.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *gst = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(postureWithGesture:)];
//    [self.gst addTarget:self action:@selector(postureWithGesture:)];
    [self.img addGestureRecognizer:gst];
}
-(void)postureWithGesture:(UITapGestureRecognizer*)gst
{
    CGPoint p = [ gst locationInView:gst.view];
    CGPoint c= CGPointMake(self.img.bounds.size.width/2, self.img.bounds.size.height/2);
    NSLog(@"px:%f   cx:%f",p.x,c.x);
    NSLog(@"py:%f   cy:%f",p.y,c.y);
    CATransform3D transf ;
    if ((c.x - p.x)*(c.y - p.y) <  0) {
        transf  = CATransform3DMakeRotation(M_PI/6, (p.x - c.x)/c.x, -(p.y - c.y)/c.y ,0);
    }
    else if ((c.x - p.x)*(c.y - p.y) >  0){
        transf  = CATransform3DMakeRotation(-M_PI/6, (p.x - c.x)/c.x, -(p.y - c.y)/c.y ,0);
    }
    else if (c.x == p.x){
        transf  = CATransform3DMakeRotation(-M_PI/6, 0, 1 ,0);
    }
    else{
        transf  = CATransform3DMakeRotation(M_PI/6, 1, 0 ,0);
    }
    CATransform3D pespect = CATransform3DPerspect(transf, CGPointMake(0, 0), 500);
    CABasicAnimation *anib = [CABasicAnimation animation];
    anib.keyPath = @"transform";
    anib.duration = 0.5;
    anib.toValue  =  [NSValue valueWithCATransform3D: pespect];
    anib.autoreverses = YES;
    [self.img.layer addAnimation:anib forKey:nil];
    
//    CATransform3D transform = CATransform3DIdentity;
//    transform.m11 = 0.5;//x缩放
//    transform.m22 = 0.5;//y缩放
    
//    transform.m12 = 0.3;//x伸缩
//    transform.m21 = 1.3;//y伸缩
//    transform.m33 = 0.6;
//    transform.m34 = -0.005; // 透视效果
//    transform = CATransform3DRotate(transform,(M_PI/180*40), 0, 1, 0);
//    NSLog(@"%f,%f,%f,%f\n%f,%f,%f,%f\n%f,%f,%f,%f\n%f,%f%f,%f\n",transform.m12,transform.m12,transform.m13,transform.m14,transform.m21,transform.m22,transform.m23,transform.m24,transform.m31,transform.m32,transform.m33,transform.m34,transform.m41,transform.m42,transform.m43,transform.m44);
    
//    [UIView animateWithDuration:3 animations:^{
////        self.img.layer.anchorPoint = CGPointMake(1, 0.5);
//////        [self.img.layer setAnchorPoint:CGPointMake(1, 1)];
////        [self.img.layer setAnchorPointZ:0.5];
//        self.img.layer.transform = CATransform3DRotate(transform,M_PI/6, (p.x-c.x)/c.x, (c.y-p.y)/c.y, 0);
//    }];
#if 0
//    //基础动画
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform"];
    
//    ani.keyPath  = @"transform";//动画keyPath
    ani.toValue  =[NSValue valueWithCATransform3D:CATransform3DRotate(transform,M_PI*2, 0, 0, 1) ];//动画内容
    ani.duration = 5;
    ani.repeatCount = 10;
    ani.autoreverses = YES;
    [self.img.layer addAnimation:ani forKey:nil];
    
#endif
////    关键帧动画
#if 0
    CAKeyframeAnimation *ani1 = [CAKeyframeAnimation  animation];
    ani1.keyPath = @"position";
//    ani1.keyPath = @"transform.scale";
//    transform.rotation ;transtorm.transition
    CGMutablePathRef path = CGPathCreateMutable();//新建路径
    CGPathAddEllipseInRect(path, NULL, CGRectMake(40, 80, 200, 200));
    ani1.path = path;
//    ani1.values = @[@0.8,@1.2,@1.5,@1.2,@0.8];
//    ani1.fillMode = kCAFillModeForwards;//不清除动画
    ani1.duration = 5;
//    ani1.repeatCount = MAXFLOAT;
    ani1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//时间函数
//    [self.img.layer addAnimation:ani1 forKey:nil];
#endif
////    组动画
#if 0
    CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[ani,ani1];
    groupAni.duration = 5;
//    groupAni.repeatCount = 3;
    groupAni.fillMode = kCAFillModeForwards;
    [self.img.layer addAnimation:groupAni forKey:nil];
#endif
#if 0
//    CATransform3D zero =  CATransform3DIdentity;
//    zero.m34 = -1/200;
//    CATransform3D rotation = CATransform3DRotate(CATransform3DIdentity, M_PI/3, (p.x-c.x)/c.x, (c.y-p.y)/c.y, 0);
    CATransform3D rotation = CATransform3DMakeRotation(M_PI/9, (p.x-c.x)/c.x, (c.y-p.y)/c.y, 0);
    CATransform3D perspect = CATransform3DPerspect(rotation, CGPointMake(0, 0), 300);
    CATransform3D perspect1 = CATransform3DPerspect(perspect, CGPointMake(0, 0), 300);
    
//    CABasicAnimation *ani = [CABasicAnimation animation];
//    ani.keyPath = @"transform";
//    ani.toValue = [NSValue valueWithCATransform3D:perspect];
//    ani.duration = 1.0f;
//    ani.removedOnCompletion = NO;
//    ani.fillMode = kCAFillModeForwards;
//    ani.autoreverses =  NO;
//    [self.img.layer addAnimation:ani forKey:@"rotation"];
    
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animation];
    ani.keyPath = @"transform";
    ani.values = @[[NSValue valueWithCATransform3D:perspect],[NSValue valueWithCATransform3D:perspect1]];
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
//    ani.keyTimes = @[[NSNumber numberWithFloat:.4f],[NSNumber numberWithFloat:.5f]];
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
    ani.duration = 3.0f;
    [self.img.layer  addAnimation:ani forKey:@"perspect"];
#endif
#if 0
    CATransform3D scale = CATransform3DIdentity;
    scale.m34= -1.0f/1100;
    CATransform3D rolate = CATransform3DMakeRotation(M_PI/6, 1, 1, 0);
    CATransform3D catact  = CATransform3DConcat(rolate, scale);
    self.img.layer.transform = catact;
#endif
}
CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
