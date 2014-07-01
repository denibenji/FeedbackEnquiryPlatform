//
//  AuthSMSViewController.m
//  PublicFeedback
//
//  Created by Ben Chan on 24/6/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//
#import "AppDelegate.h"
#import "AuthSMSViewController.h"

@interface AuthSMSViewController ()

@end

@implementation AuthSMSViewController

@synthesize smsKeyInput;

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lblKeyRequest = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 50, 100, 50)];
    lblKeyRequest.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    lblKeyRequest.backgroundColor = [UIColor whiteColor];
    lblKeyRequest.text = @"OTP: ";
    [self.view addSubview:lblKeyRequest];
    
    smsKeyInput = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 50,100, 50)];
    //smsKeyInput.secureTextEntry = YES;
    smsKeyInput.keyboardType = UIKeyboardTypeNumberPad;
    smsKeyInput.backgroundColor = [UIColor blueColor];
    smsKeyInput.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:20];
    smsKeyInput.delegate = self;
    [self.view addSubview:smsKeyInput];
    [smsKeyInput becomeFirstResponder];
    
    UIButton *btnAuthSMSkey = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnAuthSMSkey.frame =CGRectMake((self.view.frame.size.width-200)/2, 100, 200, 40);
    [btnAuthSMSkey setTitle:@"Submit" forState:UIControlStateNormal];
    [btnAuthSMSkey addTarget:self action:@selector(authenticateSMSkeyButtonTap) forControlEvents:UIControlEventTouchDown];
    [btnAuthSMSkey setEnabled:YES];
    [self.view addSubview:btnAuthSMSkey];
    
    
}
// Set the maximum character length of a UITextField
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    return !([newString length] > 6);
}

- (void) authenticateSMSkeyButtonTap
{
    NSString *key = smsKeyInput.text;
    [ApplicationDelegate.spEngine authenticateAccountWithSMSKey:key onCompletion:^(NSDictionary *result){
        NSArray *user = [result objectForKey:@"user"];
        if (user ==nil || [user count]==0) {
            NSString *error = [result objectForKey:@"error"];
            NSLog(@"%@",error);
        }else{
            //NSLog(user);
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
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
