//
//  CircleReplicatorViewController.m
//  FHCAnimationDemo
//
//  Created by shouzhi on 2018/5/11.
//  Copyright © 2018年 fhc. All rights reserved.
//

#import "CircleReplicatorViewController.h"

@interface CircleReplicatorViewController ()

@property (nonatomic, retain) UIButton * radioView;

@end

@implementation CircleReplicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI {
    _radioView = [UIButton buttonWithType:UIButtonTypeCustom];
    _radioView.frame = CGRectMake(200, 200, 160, 160);
    [self.view addSubview:_radioView];
    
    _radioView.layer.backgroundColor = [UIColor clearColor].CGColor;
    CAShapeLayer * circleShapeLayer = [CAShapeLayer layer];
    circleShapeLayer.frame = _radioView.bounds;
    circleShapeLayer.fillColor = [UIColor redColor].CGColor;
    circleShapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:_radioView.bounds].CGPath;
    circleShapeLayer.opacity = 0.0;
    
    CAReplicatorLayer * replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = _radioView.bounds;
    replicatorLayer.repeatCount = HUGE;
    replicatorLayer.instanceCount = 4;
    replicatorLayer.instanceDelay = 1.0;
    [replicatorLayer addSublayer:circleShapeLayer];
    [_radioView.layer addSublayer:replicatorLayer];
    
    CABasicAnimation * opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.fromValue = @(0.3);
    opacityAnim.toValue = @(0.0);
    
    CABasicAnimation * scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0.0)];
    scaleAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.0, 1.0, 0)];
    
    CAAnimationGroup * groupAnim = [CAAnimationGroup animation];
    groupAnim.animations = @[opacityAnim, scaleAnim];
    groupAnim.duration = 4.0;
    groupAnim.autoreverses = NO;
    groupAnim.repeatCount = HUGE;
    [circleShapeLayer addAnimation:groupAnim forKey:@"groupAnim"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
