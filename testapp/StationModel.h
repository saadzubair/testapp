//
//  StationModel.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationModel : NSObject

@property (nonatomic, strong) NSString *stationId;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, strong) NSNumber *longitude;

+ (id)stationWithDictionary:(NSDictionary *)dictionary;

@end
