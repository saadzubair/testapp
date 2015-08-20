//
//  StopCell.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StopCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *trainCode;
@property (weak, nonatomic) IBOutlet UILabel *trainDate;
@property (weak, nonatomic) IBOutlet UILabel *locationCode;
@property (weak, nonatomic) IBOutlet UILabel *locationFullName;
@property (weak, nonatomic) IBOutlet UILabel *locationOrder;
@property (weak, nonatomic) IBOutlet UILabel *locationType;
@property (weak, nonatomic) IBOutlet UILabel *trainOrigin;
@property (weak, nonatomic) IBOutlet UILabel *trainDestination;
@property (weak, nonatomic) IBOutlet UILabel *scheduledArrival;
@property (weak, nonatomic) IBOutlet UILabel *scheduledDeparture;
@property (weak, nonatomic) IBOutlet UILabel *expectedArrival;
@property (weak, nonatomic) IBOutlet UILabel *expectedDeparture;
@property (weak, nonatomic) IBOutlet UILabel *arrival;
@property (weak, nonatomic) IBOutlet UILabel *departure;
@property (weak, nonatomic) IBOutlet UILabel *autoArrival;
@property (weak, nonatomic) IBOutlet UILabel *autoDepart;
@property (weak, nonatomic) IBOutlet UILabel *stopType;

@end
