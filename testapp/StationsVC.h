//
//  StationsVC.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "WebServicesManager.h"
#import "XmlParser.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "TestAppManager.h"
#import "StationModel.h"
#import "StationCell.h"
#import "TrainsVC.h"

@interface StationsVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *stationsTableView;
@property (nonatomic, strong) NSMutableArray *stationsArray;
- (IBAction)gobackAction:(id)sender;

@end
