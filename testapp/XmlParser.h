#import <Foundation/Foundation.h>
#import "StationModel.h"
#import "TrainModel.h"
#import "StopModel.h"
#import "TestAppManager.h"

@interface XmlParser : NSObject <NSXMLParserDelegate>
{
    id          Delegate;
    SEL         CallBack;
    SEL         Error_CallBack;
	NSXMLParser	*objParser;
    NSString    *ParsingMessage;
    NSString    *ParsingCheck;
    NSString    *curr;
    
    
    
    
}

@property(nonatomic) SEL                    CallBack;
@property(nonatomic) SEL                    Error_CallBack;
@property(nonatomic, strong) id             Delegate;
@property(nonatomic,strong)  NSXMLParser    *objParser;
@property(nonatomic,strong)  NSString       *ParsingMessage;
@property(nonatomic,strong)  NSString       *ParsingCheck;

@property(nonatomic,strong)  NSMutableArray *parsedArray;
@property(nonatomic,strong)  StationModel *stationModel;
@property(nonatomic,strong)  TrainModel *trainModel;
@property(nonatomic,strong)  StopModel *stopModel;

- (id)init;
+ (XmlParser *)XmlParserSharedInstance;

- (void) startParsingData:(NSXMLParser *)content
         delegate:(id)requestDelegate 
         requestSelector:(SEL)requestSelector
         WithErrorSelector:(SEL)requestErrorSelector;

-(void)Refresh_Me;
-(void)Reset;


@end
