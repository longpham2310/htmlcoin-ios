//
//  UIView+RoundedCorner.m
//  qtum wallet
//
//  Created by Long Pham on 18/01/2018.
//  Copyright © 2018 QTUM. All rights reserved.
//

#import "UIView+RoundedCorner.h"

@implementation UIView (RoundedCorner)


-(void)roundedWithCorner:(CGFloat)corner {
    self.layer.cornerRadius = corner;
    self.layer.masksToBounds = YES;
}
@end
