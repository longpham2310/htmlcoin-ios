//
//  ContentInsetLabel.m
//  qtum wallet
//
//  Created by Long Pham on 22/01/2018.
//  Copyright © 2018 QTUM. All rights reserved.
//

#import "ContentInsetLabel.h"

@implementation ContentInsetLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 8, 0, 8};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
