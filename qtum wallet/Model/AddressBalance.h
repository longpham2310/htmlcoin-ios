//
//  AddressBalance.h
//  qtum wallet
//
//  Created by Vu Do on 1/31/18.
//  Copyright © 2018 QTUM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBalance : NSObject

-(void)setupWithObject:(id)object;

-(NSNumber* )getBalance;
-(NSNumber* )getUnconfirmedBalance;
-(NSNumber* )getImmature;
@end
