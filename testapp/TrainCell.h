//
//  TrainCell.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serverTime;
@property (weak, nonatomic) IBOutlet UILabel *trainCode;
@property (weak, nonatomic) IBOutlet UILabel *stationFullName;
@property (weak, nonatomic) IBOutlet UILabel *stationCode;
@property (weak, nonatomic) IBOutlet UILabel *queryTime;
@property (weak, nonatomic) IBOutlet UILabel *trainDate;
@property (weak, nonatomic) IBOutlet UILabel *origin;
@property (weak, nonatomic) IBOutlet UILabel *destination;
@property (weak, nonatomic) IBOutlet UILabel *originTime;
@property (weak, nonatomic) IBOutlet UILabel *destinationTime;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *lastLocation;
@property (weak, nonatomic) IBOutlet UILabel *dueIn;
@property (weak, nonatomic) IBOutlet UILabel *late;
@property (weak, nonatomic) IBOutlet UILabel *expArrival;
@property (weak, nonatomic) IBOutlet UILabel *expDepart;
@property (weak, nonatomic) IBOutlet UILabel *schArrival;
@property (weak, nonatomic) IBOutlet UILabel *schDepart;
@property (weak, nonatomic) IBOutlet UILabel *direction;
@property (weak, nonatomic) IBOutlet UILabel *trainType;
@property (weak, nonatomic) IBOutlet UILabel *locationType;

@end
