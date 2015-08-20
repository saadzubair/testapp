//
//  TrainsVC.m
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import "TrainsVC.h"

@interface TrainsVC ()

@end

@implementation TrainsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.trainsArray=[[[TestAppManager sharedInstance] parsedArray] mutableCopy];
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
    return [self.trainsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = kTRAIN_CELL;
    
    TrainCell *cell = (TrainCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:kTRAIN_CELL owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    TrainModel *trainModel = [self.trainsArray objectAtIndex:indexPath.row];
    
    NSLog(@"Train code: %@",trainModel.Traincode);
    
    cell.serverTime.text = [NSString stringWithFormat:@"Server Time: %@", trainModel.Servertime];
    cell.serverTime.adjustsFontSizeToFitWidth = YES;
    
    cell.trainCode.text = [NSString stringWithFormat:@"Train Code: %@", trainModel.Traincode];
    cell.trainCode.adjustsFontSizeToFitWidth = YES;
    
    cell.stationFullName.text = [NSString stringWithFormat:@"Station Full Name: %@", trainModel.Stationfullname];
    cell.stationFullName.adjustsFontSizeToFitWidth = YES;
    
    cell.stationCode.text = [NSString stringWithFormat:@"Station Code: %@", trainModel.Stationcode];
    cell.stationCode.adjustsFontSizeToFitWidth = YES;
    
    cell.queryTime.text = [NSString stringWithFormat:@"Query Time: %@", trainModel.Querytime];
    cell.queryTime.adjustsFontSizeToFitWidth = YES;
    
    cell.trainDate.text = [NSString stringWithFormat:@"Train Date: %@", trainModel.Traindate];
    cell.trainDate.adjustsFontSizeToFitWidth = YES;
    
    cell.origin.text = [NSString stringWithFormat:@"Origin: %@", trainModel.Origin];
    cell.origin.adjustsFontSizeToFitWidth = YES;
    
    cell.destination.text = [NSString stringWithFormat:@"Destination: %@", trainModel.Destination];
    cell.destination.adjustsFontSizeToFitWidth = YES;
    
    cell.originTime.text = [NSString stringWithFormat:@"Origin Time: %@", trainModel.Origintime];
    cell.originTime.adjustsFontSizeToFitWidth = YES;
    
    cell.destinationTime.text = [NSString stringWithFormat:@"Destination Time: %@", trainModel.Destinationtime];
    cell.destinationTime.adjustsFontSizeToFitWidth = YES;
    
    cell.status.text = [NSString stringWithFormat:@"Status: %@", trainModel.Status];
    cell.status.adjustsFontSizeToFitWidth = YES;
    
    cell.lastLocation.text = [NSString stringWithFormat:@"Last Location: %@", trainModel.Lastlocation];
    cell.lastLocation.adjustsFontSizeToFitWidth = YES;
    
    cell.dueIn.text = [NSString stringWithFormat:@"Due In: %@", trainModel.Duein];
    cell.dueIn.adjustsFontSizeToFitWidth = YES;
    
    cell.late.text = [NSString stringWithFormat:@"Late: %@", trainModel.Late];
    cell.late.adjustsFontSizeToFitWidth = YES;
    
    cell.expArrival.text = [NSString stringWithFormat:@"Exp. Arrival: %@", trainModel.Exparrival];
    cell.expArrival.adjustsFontSizeToFitWidth = YES;
    
    cell.expDepart.text = [NSString stringWithFormat:@"Exp. Depart: %@", trainModel.Expdepart];
    cell.expDepart.adjustsFontSizeToFitWidth = YES;
    
    cell.schArrival.text = [NSString stringWithFormat:@"Sch. Arrival: %@", trainModel.Scharrival];
    cell.schArrival.adjustsFontSizeToFitWidth = YES;
    
    cell.schDepart.text = [NSString stringWithFormat:@"Sch. Depart: %@", trainModel.Schdepart];
    cell.schDepart.adjustsFontSizeToFitWidth = YES;
    
    cell.direction.text = [NSString stringWithFormat:@"Direction: %@", trainModel.Direction];
    cell.direction.adjustsFontSizeToFitWidth = YES;
    
    cell.trainType.text = [NSString stringWithFormat:@"Train Type: %@", trainModel.Traintype];
    cell.trainType.adjustsFontSizeToFitWidth = YES;
    
    cell.locationType.text = [NSString stringWithFormat:@"Location Type: %@", trainModel.Locationtype];
    cell.locationType.adjustsFontSizeToFitWidth = YES;
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 465;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TrainModel *trainModel = [self.trainsArray objectAtIndex:indexPath.row];
    
    [TestAppManager sharedInstance].parseType = @"stopType";
    
    [SVProgressHUD show];
    
    [[WebServicesManager sharedManager] getStopsWithTrainCode:trainModel.Traincode withTrainDate:trainModel.Traindate withCallback:^(NSString *raw, id parsed, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (error) {
            [self showAlertWithTitle:@"" message:error.localizedDescription];
        }
        else{
            [self getStationsWithParser:parsed];
        }
    }];
}


#pragma mark - Other Methods
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"Ok", nil];
    
    [alertview show];
}

- (void)getStationsWithParser:(NSXMLParser *)Data
{
    [[XmlParser XmlParserSharedInstance] startParsingData:Data delegate:self
                                          requestSelector:@selector(successfulCallback)
                                        WithErrorSelector:@selector(errorCallback:)];
}

- (void)successfulCallback{
    
    [self performSelector:@selector(navigateToNextScreen) withObject:nil afterDelay:0];
    
}
- (void)errorCallback:(NSError *)Error{
    
}

-(void)navigateToNextScreen{
    
    StopsVC* stopsVC = [[StopsVC alloc] initWithNibName:kSTOPS_VC bundle:nil];
    [self.navigationController pushViewController:stopsVC animated:YES];
    
}

#pragma mark - IBAction
- (IBAction)goBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
