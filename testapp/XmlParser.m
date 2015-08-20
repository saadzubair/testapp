#import "XmlParser.h"

@implementation XmlParser

@synthesize Delegate;
@synthesize CallBack;
@synthesize Error_CallBack;
@synthesize objParser;
@synthesize ParsingMessage;
@synthesize ParsingCheck;

static XmlParser *XmlParserSharedInstance = nil;

- (id) init 
{
	if (self = [super init])
	{    
		Delegate    = nil;
		CallBack = nil;
        Error_CallBack = nil;
        objParser = nil;
        
        self.parsedArray=[NSMutableArray array];
        self.stationModel=[[StationModel alloc] init];
        self.trainModel=[[TrainModel alloc] init];
        self.stopModel=[[StopModel alloc] init];
	}
	return self;
}
+ (XmlParser *) XmlParserSharedInstance
{
	@synchronized ([XmlParser class])
	{
		if (!XmlParserSharedInstance) 
		{
        
			XmlParserSharedInstance = [[XmlParser alloc] init];
            
		}
		return XmlParserSharedInstance;
	}
	return nil;
}
- (void) startParsingData:(NSXMLParser *)content delegate:(id)requestDelegate
          requestSelector:(SEL)requestSelector
        WithErrorSelector:(SEL)requestErrorSelector
{	
    
	Delegate        = requestDelegate;
	CallBack        = requestSelector;
    Error_CallBack  = requestErrorSelector;
    ParsingCheck = nil;
    ParsingMessage = nil;
	objParser	= content;
	objParser.delegate = self;
	[objParser parse];
}
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    [self Refresh_Me];
}
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@",elementName);
    
    if ([elementName isEqualToString:@"objStation"]){
        

    }
    else if ([elementName isEqualToString:@"objStationData"]){
        
        
    }
    else if ([elementName isEqualToString:@"objTrainMovements"]){
        
        
    }
    else if ([elementName isEqualToString:@"response"])
    {
        if ([[attributeDict objectForKey:@"state"] isEqualToString:@"ok"])
        {
            ParsingCheck = @"YES";
        }
        else
        {
            ParsingCheck = @"NO";
        }
        ParsingMessage = [attributeDict objectForKey:@"description"];
    }
 
}



- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    curr = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"curr->%@",curr);
    
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([[TestAppManager sharedInstance].parseType isEqualToString:@"stationType"]){
        if([elementName isEqualToString:@"objStation"])
        {
            [self.parsedArray addObject:self.stationModel];
            self.stationModel=[[StationModel alloc] init];
        }
        else if([elementName isEqualToString:@"StationDesc"] )
        {
            self.stationModel.desc=curr;
        }
        else if([elementName isEqualToString:@"StationAlias"] )
        {
            self.stationModel.alias=curr;
        }
        else if([elementName isEqualToString:@"StationLatitude"] )
        {
            self.stationModel.latitude=[NSNumber numberWithDouble: [curr doubleValue]];
        }
        else if([elementName isEqualToString:@"StationLongitude"] )
        {
            self.stationModel.longitude=[NSNumber numberWithDouble: [curr doubleValue]];
        }
        else if([elementName isEqualToString:@"StationCode"] )
        {
            self.stationModel.code=curr;
        }
        else if([elementName isEqualToString:@"StationId"] )
        {
            self.stationModel.stationId=curr;
        }
    }
    else if([[TestAppManager sharedInstance].parseType isEqualToString:@"trainType"]){
        if ([elementName isEqualToString:@"objStationData"])
        {
            [self.parsedArray addObject:self.trainModel];
            self.trainModel=[[TrainModel alloc] init];
        }
        else if([elementName isEqualToString:@"Servertime"] )
        {
            self.trainModel.Servertime=curr;
        }
        else if([elementName isEqualToString:@"Traincode"] )
        {
            self.trainModel.Traincode=curr;
        }
        else if([elementName isEqualToString:@"Stationfullname"] )
        {
            self.trainModel.Stationfullname=curr;
        }
        else if([elementName isEqualToString:@"Stationcode"] )
        {
            self.trainModel.Stationcode=curr;
        }
        else if([elementName isEqualToString:@"Querytime"] )
        {
            self.trainModel.Querytime=curr;
        }
        else if([elementName isEqualToString:@"Traindate"] )
        {
            self.trainModel.Traindate=curr;
        }
        else if([elementName isEqualToString:@"Origin"] )
        {
            self.trainModel.Origin=curr;
        }
        else if([elementName isEqualToString:@"Destination"] )
        {
            self.trainModel.Destination=curr;
        }
        else if([elementName isEqualToString:@"Origintime"] )
        {
            self.trainModel.Origintime=curr;
        }
        else if([elementName isEqualToString:@"Destinationtime"] )
        {
            self.trainModel.Destinationtime=curr;
        }
        else if([elementName isEqualToString:@"Status"] )
        {
            self.trainModel.Status=curr;
        }
        else if([elementName isEqualToString:@"Lastlocation"] )
        {
            self.trainModel.Lastlocation=curr;
        }
        else if([elementName isEqualToString:@"Duein"] )
        {
            self.trainModel.Duein=curr;
        }
        else if([elementName isEqualToString:@"Late"] )
        {
            self.trainModel.Late=curr;
        }
        else if([elementName isEqualToString:@"Exparrival"] )
        {
            self.trainModel.Exparrival=curr;
        }
        else if([elementName isEqualToString:@"Expdepart"] )
        {
            self.trainModel.Expdepart=curr;
        }
        else if([elementName isEqualToString:@"Scharrival"] )
        {
            self.trainModel.Scharrival=curr;
        }
        else if([elementName isEqualToString:@"Schdepart"] )
        {
            self.trainModel.Schdepart=curr;
        }
        else if([elementName isEqualToString:@"Direction"] )
        {
            self.trainModel.Direction=curr;
        }
        else if([elementName isEqualToString:@"Traintype"] )
        {
            self.trainModel.Traintype=curr;
        }
        else if([elementName isEqualToString:@"Locationtype"] )
        {
            self.trainModel.Locationtype=curr;
        }
    }
    else if([[TestAppManager sharedInstance].parseType isEqualToString:@"stopType"]){
        
        if ([elementName isEqualToString:@"objTrainMovements"])
        {
            [self.parsedArray addObject:self.stopModel];
            self.stopModel=[[StopModel alloc] init];
        }
        else if([elementName isEqualToString:@"TrainCode"] )
        {
            self.stopModel.TrainCode=curr;
        }
        else if([elementName isEqualToString:@"TrainDate"] )
        {
            self.stopModel.TrainDate=curr;
        }
        else if([elementName isEqualToString:@"LocationCode"] )
        {
            self.stopModel.LocationCode=curr;
        }
        else if([elementName isEqualToString:@"LocationFullName"] )
        {
            self.stopModel.LocationFullName=curr;
        }
        else if([elementName isEqualToString:@"LocationOrder"] )
        {
            self.stopModel.LocationOrder=curr;
        }
        else if([elementName isEqualToString:@"LocationType"] )
        {
            self.stopModel.LocationType=curr;
        }
        else if([elementName isEqualToString:@"TrainOrigin"] )
        {
            self.stopModel.TrainOrigin=curr;
        }
        else if([elementName isEqualToString:@"TrainDestination"] )
        {
            self.stopModel.TrainDestination=curr;
        }
        else if([elementName isEqualToString:@"ScheduledArrival"] )
        {
            self.stopModel.ScheduledArrival=curr;
        }
        else if([elementName isEqualToString:@"ScheduledDeparture"] )
        {
            self.stopModel.ScheduledDeparture=curr;
        }
        else if([elementName isEqualToString:@"ExpectedArrival"] )
        {
            self.stopModel.ExpectedArrival=curr;
        }
        else if([elementName isEqualToString:@"ExpectedDeparture"] )
        {
            self.stopModel.ExpectedDeparture=curr;
        }
        else if([elementName isEqualToString:@"Arrival"] )
        {
            self.stopModel.Arrival=curr;
        }
        else if([elementName isEqualToString:@"Departure"] )
        {
            self.stopModel.Departure=curr;
        }
        else if([elementName isEqualToString:@"AutoArrival"] )
        {
            self.stopModel.AutoArrival=curr;
        }
        else if([elementName isEqualToString:@"AutoDepart"] )
        {
            self.stopModel.AutoDepart=curr;
        }
        else if([elementName isEqualToString:@"StopType"] )
        {
            self.stopModel.StopType=curr;
        }
    }
}
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
    [[TestAppManager sharedInstance] setParsedArray:self.parsedArray];
    
    if(Delegate && self.CallBack) 
        if([self.Delegate respondsToSelector:self.CallBack])
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.Delegate performSelector:self.CallBack withObject:nil];
#pragma clang diagnostic pop
        }
        else
            NSLog(@"No responce");
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"NSXMLParser ERROR: %@ - %@",[parseError localizedDescription], [parseError localizedRecoverySuggestion]);
    if(Delegate && self.Error_CallBack) 
        if([self.Delegate respondsToSelector:self.Error_CallBack]) 
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.Delegate performSelector:self.Error_CallBack withObject:parseError];
#pragma clang diagnostic pop
            self.Delegate = nil;
            self.CallBack = nil;
            self.Error_CallBack = nil;
        }
        else
            NSLog(@"No responce");
}
-(void)Reset
{
    Delegate = nil;
    CallBack = nil;
    Error_CallBack = nil;
    objParser = nil;
    ParsingMessage = nil;
    ParsingCheck = nil;
}
-(void)Refresh_Me
{
    ParsingCheck = nil;
    ParsingMessage = nil;
}

@end
