//
//  TrainModel.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrainModel : NSObject

@property (nonatomic, strong) NSString *Servertime;
@property (nonatomic, strong) NSString *Traincode;
@property (nonatomic, strong) NSString *Stationfullname;
@property (nonatomic, strong) NSString *Stationcode;
@property (nonatomic, strong) NSString *Querytime;
@property (nonatomic, strong) NSString *Traindate;
@property (nonatomic, strong) NSString *Origin;
@property (nonatomic, strong) NSString *Destination;
@property (nonatomic, strong) NSString *Origintime;
@property (nonatomic, strong) NSString *Destinationtime;
@property (nonatomic, strong) NSString *Status;
@property (nonatomic, strong) NSString *Lastlocation;
@property (nonatomic, strong) NSString *Duein;
@property (nonatomic, strong) NSString *Late;
@property (nonatomic, strong) NSString *Exparrival;
@property (nonatomic, strong) NSString *Expdepart;
@property (nonatomic, strong) NSString *Scharrival;
@property (nonatomic, strong) NSString *Schdepart;
@property (nonatomic, strong) NSString *Direction;
@property (nonatomic, strong) NSString *Traintype;
@property (nonatomic, strong) NSString *Locationtype;

+ (id)stationWithDictionary:(NSDictionary *)dictionary;

@end
