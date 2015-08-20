//
//  StopModel.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StopModel : NSObject

@property (nonatomic, strong) NSString *TrainCode;
@property (nonatomic, strong) NSString *TrainDate;
@property (nonatomic, strong) NSString *LocationCode;
@property (nonatomic, strong) NSString *LocationFullName;
@property (nonatomic, strong) NSString *LocationOrder;
@property (nonatomic, strong) NSString *LocationType;
@property (nonatomic, strong) NSString *TrainOrigin;
@property (nonatomic, strong) NSString *TrainDestination;
@property (nonatomic, strong) NSString *ScheduledArrival;
@property (nonatomic, strong) NSString *ScheduledDeparture;
@property (nonatomic, strong) NSString *ExpectedArrival;
@property (nonatomic, strong) NSString *ExpectedDeparture;
@property (nonatomic, strong) NSString *Arrival;
@property (nonatomic, strong) NSString *Departure;
@property (nonatomic, strong) NSString *AutoArrival;
@property (nonatomic, strong) NSString *AutoDepart;
@property (nonatomic, strong) NSString *StopType;

@end
