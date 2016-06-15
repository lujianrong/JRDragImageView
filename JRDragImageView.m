//
//  JRDragImageView.m
//  JROrderDishes
//
//  Created by lujianrong on 16/6/15.
//  Copyright © 2016年 JR. All rights reserved.
//

#import "JRDragImageView.h"

@interface JRDragImageView () {
    CGPoint _beginPoint;
}
@property (nonatomic,   copy) void (^leftDragBlock) (JRDragImageView *dragImgView);
@property (nonatomic,   copy) void (^rightDragBlock) (JRDragImageView *dragImgView);
@end
@implementation JRDragImageView
- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius        = 15;
        self.clipsToBounds              = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _beginPoint = [touch locationInView:self];    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:self];
    if (_beginPoint.x - endPoint.x > 50) {
        if (self.leftDragBlock)  self.leftDragBlock(self);
    } else if (_beginPoint.x - endPoint.x < -50) {
        if (self.rightDragBlock)  self.rightDragBlock(self);
    }
}
- (void)moveToLeftBlock:(void (^)(JRDragImageView *))leftBlock moveToRightBlock:(void (^)(JRDragImageView *))rightBlock {
    self.leftDragBlock = [leftBlock copy];
    self.rightDragBlock = [rightBlock copy];
}
@end
