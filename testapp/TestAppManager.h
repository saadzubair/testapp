//
//  InvisionManager.h
//  Invision
//
//  Created by Jameel Khan on 10/05/2015.
//  Copyright (c) 2015 Void Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestAppManager : NSObject

+ (TestAppManager *)sharedInstance;

@property (nonatomic, strong) NSMutableArray *parsedArray;

@property (nonatomic, strong) NSString *parseType;

@end
