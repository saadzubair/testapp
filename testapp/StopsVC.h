//
//  StopsVC.h
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
#import "StopModel.h"
#import "StopCell.h"

@interface StopsVC : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *stopsTableView;
@property (nonatomic, strong) NSMutableArray *stopsArray;
- (IBAction)goBackAction:(id)sender;

@end
