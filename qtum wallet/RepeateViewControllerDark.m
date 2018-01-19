//
//  RepeateViewControllerDark.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 11.07.17.
//  Copyright © 2017 QTUM. All rights reserved.
//

#import "RepeateViewControllerDark.h"
#import "UIView+RoundedCorner.h"

@interface RepeateViewControllerDark ()
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;

@end

@implementation RepeateViewControllerDark

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cancelButton roundedWithCorner:4];
    [self.confirmButton roundedWithCorner:4];
}

-(void)configPasswordView {
    
    [self.passwordView setStyle:LightStyle lenght:LongType];
    self.passwordView.delegate = self;
}

@end
