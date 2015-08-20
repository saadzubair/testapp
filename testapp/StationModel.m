//
//  StationModel.m
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import "StationModel.h"

@implementation StationModel

+ (id)stationWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc] initWithDictionary:dictionary];
}

- (id)initWithDictionary:(NSDictionary *)dictionary{
    
    self= [super init];
    if(self){
        
    }
    
    return self;
}

@end
