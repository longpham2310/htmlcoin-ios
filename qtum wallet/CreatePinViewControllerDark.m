//
//  CreatePinViewControllerDark.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 11.07.17.
//  Copyright © 2017 QTUM. All rights reserved.
//

#import "CreatePinViewControllerDark.h"

@interface CreatePinViewControllerDark ()

@end

@implementation CreatePinViewControllerDark

-(void)configPasswordView {
    
//    [self.passwordView setTextFont:[UIFont fontWithName:@"StymieLtBTLight" size:20] fontColor:[UIColor whiteColor] underlineColor:[UIColor whiteColor] tintColor:[UIColor redColor] errorFieldColor:[UIColor redColor]];
    [self.passwordView setStyle:LightStyle lenght:LongType];
    self.passwordView.delegate = self;
}

@end
