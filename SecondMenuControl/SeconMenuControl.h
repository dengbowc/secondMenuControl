//
//  SeconMenuControl.h
//  SecondMenuViewControl
//
//  Created by 瑶波波 on 16/7/8.
//  Copyright © 2016年 dengbowc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecontMenuProtocol <NSObject>

- (void)secondMenuHeightChanged:(CGFloat)afterH beforeHeight:(CGFloat)beforeHeight;

@end

@interface SeconMenuControl : UIView

/**
 *  构造器
 *
 *  @param frame   frame
 *  @param title   二级菜单标题
 *  @param subView 弹出的二级view
 *
 *  @return self
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title subView:(UIView *)subView;

@property (nonatomic,weak)id<SecontMenuProtocol> delegate;

@end

