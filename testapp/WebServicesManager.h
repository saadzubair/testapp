//
//  WebServicesManager.h
//  spin
//
 // 29/09/2014.
//  Copyright (c) 2014 Mobile Media Partners. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>



/*string response/erro message , parsed response , error if any*/
typedef void (^WebServicesManagerCallback)(NSString *raw,id parsed,NSError *error);


@interface WebServicesManager : AFHTTPRequestOperationManager


+ (id)sharedManager;


/*shared*/


- (void)getStationsWithCallback:(WebServicesManagerCallback)callback;

- (void)getTrainsWithStationCode:(NSString*)stationCode withCallback:(WebServicesManagerCallback)callback;

- (void)getStopsWithTrainCode:(NSString*)trainCode withTrainDate:(NSString*)trainDate withCallback:(WebServicesManagerCallback)callback;

@end
