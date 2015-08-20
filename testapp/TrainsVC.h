//
//  TrainsVC.h
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
#import "TrainModel.h"
#import "TrainCell.h"
#import "StopsVC.h"

@interface TrainsVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *trainsTableView;
@property (nonatomic, strong) NSMutableArray *trainsArray;
- (IBAction)goBackAction:(id)sender;

@end
