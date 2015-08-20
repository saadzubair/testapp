//
//  StopsVC.m
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import "StopsVC.h"

@interface StopsVC ()

@end

@implementation StopsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.stopsArray=[[[TestAppManager sharedInstance] parsedArray] mutableCopy];
    [[TestAppManager sharedInstance].parsedArray removeAllObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - TableView DataSource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.stopsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = kSTOP_CELL;
    
    StopCell *cell = (StopCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:kSTOP_CELL owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    StopModel *stopModel = [self.stopsArray objectAtIndex:indexPath.row];
    
    cell.trainCode.text = [NSString stringWithFormat:@"Train Code: %@", stopModel.TrainCode];
    cell.trainCode.adjustsFontSizeToFitWidth = YES;
    
    cell.trainDate.text = [NSString stringWithFormat:@"Train Date: %@", stopModel.TrainDate];
    cell.trainDate.adjustsFontSizeToFitWidth = YES;
    
    cell.locationCode.text = [NSString stringWithFormat:@"Location Code: %@", stopModel.LocationCode];
    cell.locationCode.adjustsFontSizeToFitWidth = YES;
    
    cell.locationFullName.text = [NSString stringWithFormat:@"Location Full Name: %@", stopModel.LocationFullName];
    cell.locationFullName.adjustsFontSizeToFitWidth = YES;
    
    cell.locationOrder.text = [NSString stringWithFormat:@"Location Order: %@", stopModel.LocationOrder];
    cell.locationOrder.adjustsFontSizeToFitWidth = YES;
    
    cell.locationType.text = [NSString stringWithFormat:@"Location Type: %@", stopModel.LocationType];
    cell.locationType.adjustsFontSizeToFitWidth = YES;
    
    cell.trainOrigin.text = [NSString stringWithFormat:@"Train Origin: %@", stopModel.TrainOrigin];
    cell.trainOrigin.adjustsFontSizeToFitWidth = YES;
    
    cell.trainDestination.text = [NSString stringWithFormat:@"Train Destination: %@", stopModel.TrainDestination];
    cell.trainDestination.adjustsFontSizeToFitWidth = YES;
    
    cell.scheduledArrival.text = [NSString stringWithFormat:@"Scheduled Arrival: %@", stopModel.ScheduledArrival];
    cell.scheduledArrival.adjustsFontSizeToFitWidth = YES;
    
    cell.scheduledDeparture.text = [NSString stringWithFormat:@"Scheduled Departure: %@", stopModel.ScheduledDeparture];
    cell.scheduledDeparture.adjustsFontSizeToFitWidth = YES;
    
    cell.expectedArrival.text = [NSString stringWithFormat:@"Expected Arrival: %@", stopModel.ExpectedArrival];
    cell.expectedArrival.adjustsFontSizeToFitWidth = YES;
    
    cell.expectedDeparture.text = [NSString stringWithFormat:@"Expected Departure: %@", stopModel.ExpectedDeparture];
    cell.expectedDeparture.adjustsFontSizeToFitWidth = YES;
    
    cell.arrival.text = [NSString stringWithFormat:@"Arrival: %@", stopModel.Arrival];
    cell.arrival.adjustsFontSizeToFitWidth = YES;
    
    cell.departure.text = [NSString stringWithFormat:@"Departure: %@", stopModel.Departure];
    cell.departure.adjustsFontSizeToFitWidth = YES;
    
    cell.autoArrival.text = [NSString stringWithFormat:@"Auto Arrival: %@", stopModel.AutoArrival];
    cell.autoArrival.adjustsFontSizeToFitWidth = YES;
    
    cell.autoDepart.text = [NSString stringWithFormat:@"Auto Depart: %@", stopModel.AutoDepart];
    cell.autoDepart.adjustsFontSizeToFitWidth = YES;
    
    cell.stopType.text = [NSString stringWithFormat:@"Stop Type: %@", stopModel.StopType];
    cell.stopType.adjustsFontSizeToFitWidth = YES;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 370;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


#pragma mark - IBAction
- (IBAction)goBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
