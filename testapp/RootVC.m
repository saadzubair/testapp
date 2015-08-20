//
//  RootVC.m
//  testapp
//
//  Created by Saad Zubair on 17/08/2015.
//  Copyright (c) 2015 Saad Zubair. All rights reserved.
//

#import "RootVC.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
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
    
    StationsVC* stationsVC = [[StationsVC alloc] initWithNibName:kSTATIONS_VC bundle:nil];
    [self.navigationController pushViewController:stationsVC animated:YES];
    
}

#pragma mark - IBAction

- (IBAction)viewStationsListAction:(id)sender {
    
    [TestAppManager sharedInstance].parseType = @"stationType";
    
    [SVProgressHUD show];
    
    [[WebServicesManager sharedManager] getStationsWithCallback:^(NSString *raw, id parsed, NSError *error) {
        
        [SVProgressHUD dismiss];
        if (error) {
            [self showAlertWithTitle:@"" message:error.localizedDescription];
        }
        else{
            [self getStationsWithParser:parsed];
        }
    }];
    
}

- (IBAction)findBestRouteAction:(id)sender {
}

@end
