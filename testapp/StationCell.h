//
//  StationCell.h
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *stationId;
@property (weak, nonatomic) IBOutlet UILabel *stationCode;
@property (weak, nonatomic) IBOutlet UILabel *stationDesc;
@property (weak, nonatomic) IBOutlet UILabel *StationAlias;
@property (weak, nonatomic) IBOutlet UILabel *StationLatitude;
@property (weak, nonatomic) IBOutlet UILabel *StationLongitude;

@end
