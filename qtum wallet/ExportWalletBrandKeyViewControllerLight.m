//
//  ExportWalletBrandKeyViewControllerLight.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 19.07.17.
//  Copyright © 2017 QTUM. All rights reserved.
//

#import "ExportWalletBrandKeyViewControllerLight.h"
#import "UIView+RoundedCorner.h"

@interface ExportWalletBrandKeyViewControllerLight ()
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;


@end

@implementation ExportWalletBrandKeyViewControllerLight

-(void)viewDidLoad {
    [super viewDidLoad];
    
    [_leftButton roundedWithCorner:_leftButton.bounds.size.height/2];
    [_rightButton roundedWithCorner:_rightButton.bounds.size.height/2];
}

@end
