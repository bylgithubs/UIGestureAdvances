//
//  ViewController.m
//  UIGestureAdvances
//
//  Created by Civet on 2019/5/21.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //加载图像
    UIImage *image = [UIImage imageNamed:@"7.jpg"];
    UIImageView *iView = [[UIImageView alloc] initWithImage:image];
    iView.frame = CGRectMake(50, 80, 200, 320);
    //开启交互功能
    iView.userInteractionEnabled = YES;
    [self.view addSubview:iView];
    
    //创建一个捏合手势
    //P1:事件对象的拥有者
    //P2:事件响应函数
    _pinchGes = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAct:)];
    //将捏合手势添加到视图中
    [iView addGestureRecognizer:_pinchGes];
    //创建旋转手势
    _rotGes = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotAct:)];
    [iView addGestureRecognizer:_rotGes];
    
    //设置手势的代理
    _pinchGes.delegate = self;
    _rotGes.delegate = self;

}

//是否可以同时响应两个手势
//如果返回值为YES,可以同时响应
//如果返回值为NO,不可以同时响应
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (void)rotAct:(UIRotationGestureRecognizer *)rot{
    UIImageView *iView = (UIImageView *)rot.view;
    //计算旋转的变换矩阵并且赋值
    iView.transform = CGAffineTransformRotate(iView.transform, rot.rotation);
    //选择角度清零
    rot.rotation = 0;
}


//捏合手势事件实现
//参数：捏合手势对象
- (void)pinchAct:(UIPinchGestureRecognizer *)pinch{
    //获取监控图像视图
    UIImageView *iView = (UIImageView *)pinch.view;
    //对图像视图对象进行矩阵变换计算并赋值
    //trnansform:表示图像学中的变换矩阵
    //参数一：原来的矩阵
    //参数二：x方向的缩放比例
    //参数三：y方向的缩放比例
    //返回值是最新的缩放后的矩阵变换
    iView.transform = CGAffineTransformScale(iView.transform, pinch.scale, pinch.scale);
    //将缩放值归位为单位值
    //scale = 1:原来的大小
    //scale < 1:缩小效果
    //scale > 1:放大效果
    pinch.scale = 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
