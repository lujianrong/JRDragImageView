//
//  JRDragImageView.h
//  JROrderDishes
//
//  Created by lujianrong on 16/6/15.
//  Copyright © 2016年 JR. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
  __block NSUInteger count = 0;
 [dragImage moveToLeftBlock:^(JRDragImageView *dragImgView) {
    if (count>=_dataSource.count-1) {
        return;
    }
    CATransition* sition = [CATransition animation];
    sition.type = kCATransitionMoveIn;
    sition.subtype = kCATransitionFromRight;
    [dragImage sd_setImageWithURL:[NSURL URLWithString:_dataSource[count]]];
    [dragImage.layer addAnimation:sition forKey:@"animation"];
    count++;
 
 } moveToRightBlock:^(JRDragImageView *dragImgView) {
    if (count ==0) {
        return;
    }
    CATransition* sition = [CATransition animation];
    sition.type = kCATransitionMoveIn;
    sition.subtype = kCATransitionFromLeft;
    [dragImage sd_setImageWithURL:[NSURL URLWithString:_dataSource[count]]];
    [dragImage.layer addAnimation:sition forKey:@"animation"];
    count--;
 }];

 */
@interface JRDragImageView : UIImageView
- (void)moveToLeftBlock:(void (^)(JRDragImageView * dragImgView))leftBlock moveToRightBlock:(void (^)(JRDragImageView *dragImgView))rightBlock;
@end
