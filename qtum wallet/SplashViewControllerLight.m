//
//  SplashViewControllerLight.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 04.08.17.
//  Copyright © 2017 QTUM. All rights reserved.
//

#import "SplashViewControllerLight.h"
#import "AnimatedLogoImageVIewLight.h"

@interface SplashViewControllerLight ()
@property (weak, nonatomic) IBOutlet UIView *animatedBacgroundView;

@property (weak, nonatomic) IBOutlet UILabel *animatedQTUMLabel;
@property (weak, nonatomic) IBOutlet UILabel *animatedWaitingLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatedLogoHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatedQTUMLabelHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatedWaitLabelHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *animatedBacgroungViewHeightConstraint;
@property (weak, nonatomic) IBOutlet AnimatedLogoImageVIewLight *animatedLogoView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;


@end

@implementation SplashViewControllerLight

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.titleLabel.text = NSLocalizedString(@"htmlcoin", @"");
    self.subTitleLabel.text = [NSLocalizedString(@"In blockchain we trust", @"") uppercaseString];
    
    self.titleLabel.alpha = 0.0f;
    self.subTitleLabel.alpha = 0.0f;
}

-(void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];    
}

-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:1.0f animations:^{
        self.titleLabel.alpha = 1.0f;
        self.subTitleLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
        //[self.logoImageView startAnimating];
    }];
    /*self.animatedLogoView.translatesAutoresizingMaskIntoConstraints = NO;
    self.animatedBacgroungViewHeightConstraint.constant = self.view.frame.size.height;
    
    CGFloat duration = 3;
    CGFloat logoCoeff = 0.35;
    CGFloat qtumLabelCoeff = 0.45;
    
    __weak typeof(self)weakSelf = self;
    
    [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState  animations:^{
        [weakSelf.view layoutIfNeeded];
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(logoCoeff * duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.animatedLogoView startAnimating];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(qtumLabelCoeff * duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        weakSelf.animatedQTUMLabelHeightConstraint.constant = 0;
        [UIView animateWithDuration:0.7 delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState  animations:^{
            [weakSelf.view layoutIfNeeded];
        } completion:nil];
    });
    
    weakSelf.animatedWaitLabelHeightConstraint.constant = 0;
    */
}

@end
