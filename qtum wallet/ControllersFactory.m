//
//  ControllersFactory.m
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 26.12.16.
//  Copyright © 2016 Designsters. All rights reserved.
//

#import "ControllersFactory.h"
#import "SendNavigationCoordinator.h"
#import "NewsNavigationController.h"
#import "ProfileNavigationCoordinator.h"
#import "UIViewController+Extension.h"
#import "TabBarController.h"
#import "WalletNameViewController.h"
#import "LoginViewController.h"
#import "FirstAuthViewController.h"
#import "RestoreWalletViewController.h"
#import "CreatePinViewController.h"
#import "RepeateViewController.h"
#import "AuthNavigationController.h"
#import "ExportWalletBrandKeyViewController.h"
#import "SubscribeTokenViewController.h"
#import "HistoryViewController.h"
#import "WalletNavigationController.h"
#import "RecieveViewController.h"
#import "HistoryItemViewController.h"
#import "CustomAbiInterphaseViewController.h"
#import "CreateTokenFinishViewController.h"
#import "BalancePageViewController.h"
#import "MainViewController.h"
#import "TokenListViewController.h"
#import "TokenFunctionViewController.h"
#import "TokenFunctionDetailViewController.h"
#import "TemplateTokenViewController.h"


@implementation ControllersFactory

+ (instancetype)sharedInstance
{
    static ControllersFactory *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] initUniqueInstance];
    });
    return instance;
}

- (instancetype)initUniqueInstance
{
    self = [super init];
    if (self != nil) { }
    return self;
}

-(UIViewController*)sendFlowTab{
    UIViewController* controller = [UIViewController controllerInStoryboard:@"Send" withIdentifire:nil];
    SendNavigationCoordinator* nav = [[SendNavigationCoordinator alloc] initWithRootViewController:controller];
    return nav;
}

-(UIViewController*)profileFlowTab{
    UIViewController* controller = [UIViewController controllerInStoryboard:@"Profile" withIdentifire:nil];
    ProfileNavigationCoordinator* nav = [[ProfileNavigationCoordinator alloc] initWithRootViewController:controller];
    return nav;
}

-(UIViewController*)newsFlowTab{
    UIViewController* controller = [UIViewController controllerInStoryboard:@"News" withIdentifire:nil];
    NewsNavigationController* nav = [[NewsNavigationController alloc] initWithRootViewController:controller];
    return nav;
}

-(UIViewController*)createTabFlow{
    TabBarController* tabBar = [TabBarController new];
    return tabBar;
}


-(UINavigationController*)walletFlowTab{
    BalancePageViewController* controller = [[BalancePageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    controller.view.backgroundColor = customBlackColor();
    WalletNavigationController* nav = [[WalletNavigationController alloc] initWithRootViewController:controller];
    return nav;
}

-(WalletNameViewController*)createWalletNameCreateController{
    WalletNameViewController* controller = (WalletNameViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"WalletNameViewController"];
    return controller;
}

-(LoginViewController*)createLoginController{
    LoginViewController* controller = (LoginViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"LoginViewController"];
    return controller;
}

-(FirstAuthViewController*)createFirstAuthController{
    FirstAuthViewController* controller = (FirstAuthViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"FirstAuthViewController"];
    return controller;
}

-(RestoreWalletViewController*)createRestoreWalletController{
    RestoreWalletViewController* controller = (RestoreWalletViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"RestoreWalletViewController"];
    return controller;
}

-(CreatePinViewController*)createCreatePinController{
    CreatePinViewController* controller = (CreatePinViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"CreatePinViewController"];
    return controller;
}

-(RepeateViewController*)createRepeatePinController{
    RepeateViewController* controller = (RepeateViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"RepeateViewController"];
    return controller;
}

-(AuthNavigationController*)createAuthNavigationController {
    AuthNavigationController* controller = [[AuthNavigationController alloc]init];
    return controller;
}

-(ExportWalletBrandKeyViewController*)createExportWalletBrandKeyViewController{
    ExportWalletBrandKeyViewController* controller = (ExportWalletBrandKeyViewController*)[UIViewController controllerInStoryboard:@"Start" withIdentifire:@"ExportWalletBrandKeyViewController"];
    return controller;
}

-(SubscribeTokenViewController*)createSubscribeTokenViewController{
    SubscribeTokenViewController* controller = (SubscribeTokenViewController*)[UIViewController controllerInStoryboard:@"SubscribeToken" withIdentifire:@"SubscribeTokenViewController"];
    return controller;
}

-(RecieveViewController*)createRecieveViewController{
    RecieveViewController* controller = (RecieveViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"RecieveViewController"];
    return controller;
}

-(HistoryItemViewController*)createHistoryItem{
    HistoryItemViewController* controller = (HistoryItemViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"HistoryItemViewController"];
    return controller;
}

-(MainViewController*)createMainViewController{
    MainViewController* controller = (MainViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"MainViewController"];
    return controller;
}

-(CustomAbiInterphaseViewController*)createCustomAbiInterphaseViewController{
    CustomAbiInterphaseViewController* controller = (CustomAbiInterphaseViewController*)[UIViewController controllerInStoryboard:@"CreateToken" withIdentifire:@"CustomAbiInterphaseViewController"];
    return controller;
}

-(CreateTokenFinishViewController*)createCreateTokenFinishViewController{
    CreateTokenFinishViewController* controller = (CreateTokenFinishViewController*)[UIViewController controllerInStoryboard:@"CreateToken" withIdentifire:@"CreateTokenFinishViewController"];
    return controller;
}

-(TokenListViewController*)createTokenListViewController{
    TokenListViewController* controller = (TokenListViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"TokenListViewController"];
    return controller;
}

-(TokenFunctionViewController*)createTokenFunctionViewController{
    TokenFunctionViewController* controller = (TokenFunctionViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"TokenFunctionViewController"];
    return controller;
}

-(TokenFunctionDetailViewController*)createTokenFunctionDetailViewController{
    TokenFunctionDetailViewController* controller = (TokenFunctionDetailViewController*)[UIViewController controllerInStoryboard:@"Wallet" withIdentifire:@"TokenFunctionDetailViewController"];
    return controller;
}

-(TemplateTokenViewController*)createTemplateTokenViewController{
    TemplateTokenViewController* controller = (TemplateTokenViewController*)[UIViewController controllerInStoryboard:@"CreateToken" withIdentifire:@"TemplateTokenViewController"];
    return controller;
}


-(UIViewController*)createFlowNavigationCoordinator{
    return nil;
}

-(UIViewController*)createPinFlowController{
    return nil;
}

-(UIViewController*)createWalletFlowController{
    return nil;
}

-(UIViewController*)changePinFlowController{
    return nil;
}

@end
