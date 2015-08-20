//
//  StationsVC.m
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import "StationsVC.h"

@interface StationsVC ()

@end

@implementation StationsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.stationsArray=[[[TestAppManager sharedInstance] parsedArray] mutableCopy];
    [[TestAppManager sharedInstance].parsedArray removeAllObjects];
    
//    StationModel *stationModel = [self.stationsArray objectAtIndex:0];
//    
//    NSLog(@"The id: %@",stationModel.stationId);
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
    return [self.stationsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = kSTATION_CELL;
    
    StationCell *cell = (StationCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:kSTATION_CELL owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
    
    StationModel *stationModel = [self.stationsArray objectAtIndex:indexPath.row];
    
    NSLog(@"The id: %@",stationModel.stationId);
    
    cell.stationId.text = [NSString stringWithFormat:@"ID: %@", stationModel.stationId];
    cell.stationId.adjustsFontSizeToFitWidth = YES;
    
    cell.stationCode.text = [NSString stringWithFormat:@"Code: %@", stationModel.code];
    cell.stationCode.adjustsFontSizeToFitWidth = YES;
    
    cell.stationDesc.text = [NSString stringWithFormat:@"Desc: %@", stationModel.desc];
    cell.stationDesc.adjustsFontSizeToFitWidth = YES;
    
    cell.StationAlias.text = [NSString stringWithFormat:@"Alias: %@", stationModel.alias];
    cell.StationAlias.adjustsFontSizeToFitWidth = YES;
    
    cell.StationLatitude.text = [NSString stringWithFormat:@"Latitude: %@", stationModel.latitude];
    cell.StationLatitude.adjustsFontSizeToFitWidth = YES;
    
    cell.StationLongitude.text = [NSString stringWithFormat:@"Longitude: %@", stationModel.longitude];
    cell.StationLongitude.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    StationModel *stationModel = [self.stationsArray objectAtIndex:indexPath.row];
    
    [TestAppManager sharedInstance].parseType = @"trainType";
    
    [SVProgressHUD show];
    
    [[WebServicesManager sharedManager] getTrainsWithStationCode:stationModel.code withCallback:^(NSString *raw, id parsed, NSError *error) {
        
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
    
    TrainsVC* trainsVC = [[TrainsVC alloc] initWithNibName:kTRAINS_VC bundle:nil];
    [self.navigationController pushViewController:trainsVC animated:YES];
    
}

#pragma mark - IBAction
- (IBAction)gobackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
