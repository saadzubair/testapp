//
//  RootVC.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "WebServicesManager.h"
#import "XmlParser.h"
#import "StationsVC.h"

@interface RootVC : UIViewController

- (IBAction)viewStationsListAction:(id)sender;

- (IBAction)findBestRouteAction:(id)sender;

@end
