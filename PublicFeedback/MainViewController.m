//
//  MainViewController.m
//  PublicFeedback
//
//  Created by Ben Chan on 5/5/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *apikey = [defaults objectForKey:@"apikey"];
    //NSString *email = [defaults objectForKey:@"email"];
    
    //NSLog([NSString stringWithFormat:@"%@",username]);
    NSLog([NSString stringWithFormat:@"APIKEYYYYYYYYYYYYYY =>> %@",apikey]);
    //NSLog([NSString stringWithFormat:@"%f,%f",self.view.bounds.size.width,self.view.bounds.size.height]);
    [ApplicationDelegate.spEngine retrieveUserWithAPIKey:apikey onCompletion:^(NSDictionary *result){
        NSLog([NSString stringWithFormat:@"RESULT %@",result]);
    }];
    [self draw];
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

-(void)draw
{
    float statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    UIView *topBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0+statusBarHeight, self.view.bounds.size.width, 30)];
    [topBar setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:topBar];
    
    UILabel *lblLogoTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    lblLogoTitle.text = @"Feedback System";
    lblLogoTitle.textAlignment = NSTextAlignmentCenter;
    [topBar addSubview:lblLogoTitle];
    
    UIButton *btnCreate = [[UIButton alloc]initWithFrame:CGRectMake(topBar.bounds.size.width-30, 0, 40, 40)];
    [btnCreate setTitle:@"Create" forState:UIControlStateNormal];
    [btnCreate setBackgroundColor:[UIColor blackColor]];
    [topBar addSubview:btnCreate];
    
    UIView *bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-30, self.view.bounds.size.width, 30)];
    [bottomBar setBackgroundColor:[UIColor brownColor]];
    [self.view addSubview:bottomBar];
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 106, 30)];
    [btnHome setTitle:@"Home" forState:UIControlStateNormal];
    [btnHome setBackgroundColor:[UIColor blueColor]];
    [bottomBar addSubview:btnHome];
    
    UIButton *btnNotification = [[UIButton alloc]initWithFrame:CGRectMake(106, 0, 108, 30)];
    [btnNotification setTitle:@"Notifications" forState:UIControlStateNormal];
    [btnNotification setBackgroundColor:[UIColor redColor]];
    [bottomBar addSubview:btnNotification];
    
    UIButton *btnMyProfile = [[UIButton alloc]initWithFrame:CGRectMake(214, 0, 106, 30)];
    [btnMyProfile setTitle:@"My Profile" forState:UIControlStateNormal];
    [btnMyProfile setBackgroundColor:[UIColor greenColor]];
    [bottomBar addSubview:btnMyProfile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
