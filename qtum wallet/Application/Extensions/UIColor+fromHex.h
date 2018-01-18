//
//  UIColor+fromHex.h
//  qtum wallet
//
//  Created by Long Pham on 18/01/2018.
//  Copyright © 2018 QTUM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (fromHex)
+ (UIColor *)colorwithHexString:(NSString *)hexStr alpha:(CGFloat)alpha;
@end
