//
//  WebServicesManager.m
//  spin
//
 // 29/09/2014.
//  Copyright (c) 2014 Mobile Media Partners. All rights reserved.
//

#import "WebServicesManager.h"
#import <AFAmazonS3Client/AFAmazonS3Manager.h>
#import "XmlParser.h"


#define BASE_URL @"http://api.irishrail.ie/"


@interface WebServicesManager ()


- (NSError *)getProperError:(NSError *)error;
@end


@implementation WebServicesManager


static WebServicesManager *sharedInstance;


+ (WebServicesManager *) sharedManager{
    
    if(sharedInstance==nil){
        sharedInstance= [[WebServicesManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        [sharedInstance setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [sharedInstance setResponseSerializer:[AFXMLParserResponseSerializer serializer]];
        //sharedInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects: @"application/xml", nil];
    }
    
    
    
    return sharedInstance;
}

- (NSError *)getProperError:(NSError *)error{
    
    @try {
        NSData *date = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
        NSString *dataStr = [[NSString alloc] initWithData:date encoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject=[NSJSONSerialization
                                  JSONObjectWithData:date
                                  options:NSJSONReadingMutableLeaves
                                  error:nil];
        
        
        NSString *anyError = [jsonObject objectForKey:@"error"];
        
        NSError *err = [NSError errorWithDomain:NSStringFromClass([self class])
                                           code:200
                                       userInfo:@{
                                                  NSLocalizedDescriptionKey:anyError
                                                  }];
        
        return err;
    }
    @catch (NSException *exception) {
        //DDLogDebug(@"Webcall failed: %@", [exception description]);
        NSError *err = [NSError errorWithDomain:NSStringFromClass([self class])
                                           code:200
                                       userInfo:@{
                                                  NSLocalizedDescriptionKey:@"Something went wrong"
                                                  }];
        return err;
    }
   
    
}




#pragma mark - SHARED API




- (void)getStationsWithCallback:(WebServicesManagerCallback)callback{
    
    [self GET:@"realtime/realtime.asmx/getAllStationsXML"
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, NSXMLParser  *responseObject) {
          
          callback(nil,responseObject , nil);
          
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          
          callback(nil,nil , [self getProperError:error]);
          
          
      }];
    
}

- (void)getTrainsWithStationCode:(NSString*)stationCode withCallback:(WebServicesManagerCallback)callback{
    
    [self GET:[NSString stringWithFormat:@"realtime/realtime.asmx/getStationDataByCodeXML?StationCode=%@",stationCode]
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, NSXMLParser  *responseObject) {
          
          callback(nil,responseObject , nil);
          
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          
          callback(nil,nil , [self getProperError:error]);
          
          
      }];
    
}


- (void)getStopsWithTrainCode:(NSString*)trainCode withTrainDate:(NSString*)trainDate withCallback:(WebServicesManagerCallback)callback{
    
    trainDate = [trainDate stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    [self GET:[NSString stringWithFormat:@"realtime/realtime.asmx/getTrainMovementsXML?TrainId=%@&TrainDate=%@",trainCode,trainDate]
   parameters:nil
      success:^(AFHTTPRequestOperation *operation, NSXMLParser  *responseObject) {
          
          callback(nil,responseObject , nil);
          
          
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          
          callback(nil,nil , [self getProperError:error]);
          
          
      }];
    
}


#pragma mark -


@end
