//
//  InvisionManager.m
//  Invision
//
//  Created by Jameel Khan on 10/05/2015.
//  Copyright (c) 2015 Void Labs. All rights reserved.
//

#import "TestAppManager.h"



@implementation TestAppManager

static TestAppManager *shared;

+ (TestAppManager *)sharedInstance{
    
    if(!shared){
        shared= [[TestAppManager alloc] init];
    }
    
    return shared;
}


@end
