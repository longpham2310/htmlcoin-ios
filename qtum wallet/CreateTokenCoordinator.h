//
//  CreateTokenCoordinator.h
//  qtum wallet
//
//  Created by Vladimir Lebedevich on 03.03.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "ResultTokenInputsModel.h"
@class TemplateModel;

@protocol CreateTokenCoordinatorDelegate <NSObject>

@required
-(void)createStepOneCancelDidPressed;
-(void)createStepOneNextDidPressedWithInputs:(NSArray<ResultTokenInputsModel*>*) inputs;
-(void)finishStepFinishDidPressed;
-(void)finishStepBackDidPressed;
-(void)didSelectContractStore;
-(void)didSelectPublishedContracts;
-(void)didSelectNewContracts;
-(void)didPressedQuit;
-(void)didPressedBack;
-(void)didDeselectTemplateIndexPath:(NSIndexPath*) indexPath withName:(TemplateModel*) templateModel;


@end

@interface CreateTokenCoordinator : BaseCoordinator <Coordinatorable,CreateTokenCoordinatorDelegate>

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController;

@end
