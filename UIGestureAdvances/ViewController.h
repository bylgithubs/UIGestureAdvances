//
//  ViewController.h
//  UIGestureAdvances
//
//  Created by Civet on 2019/5/21.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

//定义一个缩放手势，用来对视图可以进行放大缩小，Pinch:捏合手势
@property(nonatomic,strong) UIPinchGestureRecognizer *pinchGes;
//定义一个旋转手势，主要用来旋转图像视图
@property(nonatomic,strong) UIRotationGestureRecognizer *rotGes;

@end

