//
//  StartViewController.m
//  PublicFeedback
//
//  Created by Ben Chan on 28/4/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
// iphone 5 320x568

#import "StartViewController.h"
#import "MainViewController.h"
#import "AuthSMSViewController.h"
#import "Constants.h"

#define kOFFSET_FOR_KEYBOARD 80.0

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize colorText, fontHeader, fontText, loginUserName, loginPassword, loginView, profilePictureView, lblFBname, lblFBstatus, defaults, sideView, registerEmail, registerPassword, registerCfmPassword, registerContactNo, registerName, btnRegister;

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
    colorText = [UIColor colorWithRed:70.f/255.f green:123.f/255.f blue:138.f/255.f alpha:1.f];
    fontHeader = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    fontText = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15];
    float statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    float startHeight = 140.0;
    NSLog(@"statusbar: %f",statusBarHeight);
    
    loginView = [[UIView alloc]initWithFrame:CGRectMake(0, statusBarHeight, self.view.bounds.size.width, self.view.bounds.size.height-statusBarHeight)];
    loginView.backgroundColor = [UIColor clearColor];
    
    //Title: Public Feedback and Enquiry Platform
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(50, startHeight+10, loginView.bounds.size.width-20, 40)];
    lblTitle.text = @"Public Feedback and Enquiry Platform   ______________";
    lblTitle.font = [UIFont fontWithName:@"Georgia-Bold" size:20];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.numberOfLines = 0;
    [lblTitle sizeToFit];
    [loginView addSubview:lblTitle];
    
    CGSize expectedSize = [lblTitle.text boundingRectWithSize:CGSizeMake(151, 104) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: lblTitle.font} context:nil].size;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    UIView *paddingPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    
    //username
    loginUserName = [[UITextField alloc] initWithFrame:CGRectMake((loginView.frame.size.width-220)/2,10+startHeight+expectedSize.height,220,20)];
    loginUserName.placeholder = @"Email";
    loginUserName.text = @"cs.chan.2011@sis.smu.edu.sg";
    loginUserName.backgroundColor = [UIColor clearColor];
    loginUserName.autocorrectionType = UITextAutocorrectionTypeNo;
    loginUserName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    loginUserName.font = [UIFont fontWithName:SP_THEME_FONT_BOLD size:16];
    loginUserName.leftView = paddingView;
    loginUserName.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    [loginUserName setBackground:[UIImage imageNamed:@"Background_TextField"]];
    [loginView addSubview:loginUserName];
    
    //password
    loginPassword = [[UITextField alloc] initWithFrame:CGRectMake((loginView.frame.size.width-220)/2,35+startHeight+expectedSize.height,220,20)];
    loginPassword.placeholder = @"Password";
    loginPassword.text = @"123456";
    loginPassword.secureTextEntry = YES;
    loginPassword.backgroundColor = [UIColor clearColor];
    loginPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    loginPassword.autocapitalizationType = UITextAutocapitalizationTypeWords;
    loginPassword.font = [UIFont fontWithName:SP_THEME_FONT_BOLD size:16];
    loginPassword.leftView = paddingPasswordView;
    loginPassword.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    [loginPassword setBackground:[UIImage imageNamed:@"Background_TextField"]];
    [loginView addSubview:loginPassword];
    
    UIButton *btnNormalLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    btnNormalLogin.frame = CGRectMake(70, 65+startHeight+expectedSize.height, 180, 30);
    btnNormalLogin.backgroundColor = [UIColor blackColor];
    [btnNormalLogin setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [btnNormalLogin setTitle:@"Login" forState:UIControlStateNormal];
    [btnNormalLogin setEnabled:YES];
    
    [loginView addSubview:btnNormalLogin];
    [btnNormalLogin addTarget:self action:@selector(loginButtonTap) forControlEvents:UIControlEventTouchDown];
    
    /*  LOAD IMAGE
    UIImage *image = [UIImage imageNamed:@"Button_Grey@2x"];
    [btnAdminLogin setBackgroundImage:image forState:UIControlStateNormal];
    */
    int x = self.view.bounds.size.width;
    int y = self.view.bounds.size.height;
    NSLog ([NSString stringWithFormat:@"length= %d, height= %d",x,y ]);
    [self.view addSubview:loginView];
    
    //Facebook integration
    // Create a FBLoginView to log the user in with basic, email and likes permissions
    // You should ALWAYS ask for basic permissions (basic_info) when logging the user in
    FBLoginView *fbView = [[FBLoginView alloc] initWithReadPermissions:@[@"basic_info", @"email", @"user_likes"]];
    // Align the button in the center horizontally
    fbView.frame = CGRectOffset(fbView.frame, 60, 130+startHeight+expectedSize.height);
    fbView.delegate = self;
    [loginView addSubview:fbView];
    
    profilePictureView = [[FBProfilePictureView alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    [loginView addSubview:profilePictureView];
    lblFBname = [[UILabel alloc]initWithFrame:CGRectMake(10, 60, 180, 20)];
    lblFBname.font = [UIFont fontWithName:SP_THEME_FONT size:12];
    [loginView addSubview:lblFBname];
    
    lblFBstatus = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 180, 20)];
    lblFBstatus.font = [UIFont fontWithName:SP_THEME_FONT size:12];
    [loginView addSubview:lblFBstatus];
    
    UIButton *btnUserRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    btnUserRegister.frame = CGRectMake((loginView.bounds.size.width-200)/2, 220+startHeight+expectedSize.height, 200, 20);
    btnUserRegister.backgroundColor = [UIColor clearColor];
    btnUserRegister.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnUserRegister setTitleColor:colorText forState:UIControlStateNormal];
    [btnUserRegister setTitle:@"New User Registration" forState:UIControlStateNormal];
    [btnUserRegister setEnabled:YES];
    
    [loginView addSubview:btnUserRegister];
    [btnUserRegister addTarget:self action:@selector(newRegistrationButtonTap:) forControlEvents:UIControlEventTouchDown];
}
// manual login
-(void) loginButtonTap
{
    NSString *name = loginUserName.text;
    NSString *pass = loginPassword.text;
    [self login:name withPassword:pass];
    loginUserName.text = nil;
    loginPassword.text = nil;
}

// manual login
-(void) registerButtonTap
{
    NSString *email = registerEmail.text;
    NSString *pass1 = registerPassword.text;
    NSString *pass2 = registerCfmPassword.text;
    NSString *name = registerName.text;
    int contactNum = [registerContactNo.text intValue];
    /*if([email length]>0 && [pass1 length]>0 && [pass2 length]>0 && [name length]>0 && contactNum>0){
        if([pass1 isEqualToString:pass2]){
            //[self registerUser:email withPassword:pass1 withFullName:name withContactNo:contactNum];
            [ApplicationDelegate.spEngine registerUserWithEmail:email withPassword:pass1 withFullName:name withContactNum:contactNum withUserType:1 onCompletion:^(NSDictionary *result){
                AuthSMSViewController *authSMSController = [[AuthSMSViewController alloc]initWithNibName:nil bundle:nil];
                [self presentViewController:authSMSController animated:YES completion:nil];
            }];
        }else{
            NSLog(@"Password does not match");
        }
    }else{
        NSLog(@"Fields cannot be empty ");
    }*/
    
    registerEmail.text = nil;
    registerPassword.text = nil;
    registerCfmPassword.text = nil;
    registerName.text = nil;
    registerContactNo.text = nil;
    [self dismissRegisterView];
    
    AuthSMSViewController *authSMSController = [[AuthSMSViewController alloc]initWithNibName:nil bundle:nil];
    [self presentViewController:authSMSController animated:YES completion:nil];
}

// to validate login into the main page
-(void)login:(NSString *)email withPassword:(NSString *)password
{
    if((email!=NULL && ![email isEqualToString:@""])&&(password!=NULL && ![password isEqualToString:@""])){
        [ApplicationDelegate.spEngine loginUserWithPassword:password withEmail:email onCompletion:^(NSDictionary *result){
            NSString *apikey = [result objectForKey:@"apikey"];
            NSString *email1 = [result objectForKey:@"email"];
            NSLog(@"APIKEY= %@",result);
            if(apikey !=NULL && ![apikey isEqualToString:@""])
            {
                defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:email1 forKey:@"email"];
                [defaults setObject:apikey forKey:@"apikey"];
                MainViewController *mainViewController = [[MainViewController alloc]init];
                //mainViewController.apikey = apikey;
                //mainViewController.email = email;
                //[self.navigationController pushViewController:mainViewController animated:YES];
                [self presentViewController:mainViewController animated:YES completion:^(void){
                }];
            }
            else
            {
                NSString *error = [result objectForKey:@"error"];
                NSLog(@"Error: %@",error);
            }
        }];
    }
}

- (void)registerUser:(NSString *)email withPassword:(NSString *)password withFullName:(NSString *)fullName withContactNo: (int)contactNumber
{
    
}
- (void)newRegistrationButtonTap:(UIButton *)sender
{
    [[UIApplication sharedApplication]setStatusBarHidden:YES];
    sideView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [sideView setBackgroundColor:[UIColor blackColor]];
    sideView.alpha = 0.8f;
    [self.view addSubview:sideView];
    
    // when user tap outside of the loginView
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissRegisterView)];
    gesture.numberOfTapsRequired = 1;
    [sideView addGestureRecognizer:gesture];
    
    registerView =[[UIScrollView alloc]initWithFrame:CGRectMake(30, 30, self.view.bounds.size.width-60, self.view.bounds.size.height-60)];
    [registerView setContentSize:CGSizeMake(registerView.bounds.size.width, 340)];
    [registerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:registerView];
    
    UIImageView *loginImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background_AdminLoginBox"]];
    loginImgView.frame = CGRectMake(0, 0, registerView.frame.size.width, registerView.frame.size.height);
    [registerView addSubview:loginImgView];
    
    // Display Label
    UILabel *lblAdminLogin = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 40)];
    lblAdminLogin.textColor = [UIColor blackColor];
    lblAdminLogin.backgroundColor = [UIColor greenColor];
    lblAdminLogin.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    lblAdminLogin.text = @"New User Registration";
    [registerView addSubview:lblAdminLogin];
    
    // Display email Textfield
    registerEmail = [[UITextField alloc] initWithFrame:CGRectMake(10,60,240,30)];
    registerEmail.placeholder = @"Email";
    registerEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [registerEmail setBackground:[UIImage imageNamed:@"Background_TextField"]];
    registerEmail.backgroundColor = [UIColor greenColor];
    registerEmail.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];;
    registerEmail.leftViewMode = UITextFieldViewModeAlways;
    registerEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    registerEmail.autocapitalizationType = UITextAutocapitalizationTypeWords;
    registerEmail.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    registerEmail.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    registerEmail.delegate = self;
    registerEmail.keyboardType = UIKeyboardTypeEmailAddress;
    [registerView addSubview:registerEmail];
    //[registerEmail becomeFirstResponder];
    
    // Display password Textfield
    registerPassword = [[UITextField alloc] initWithFrame:CGRectMake(10,110,240,30)];
    registerPassword.placeholder = @"Password";
    registerPassword.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];;
    registerPassword.leftViewMode = UITextFieldViewModeAlways;
    registerPassword.backgroundColor = [UIColor greenColor];
    registerPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [registerPassword setBackground:[UIImage imageNamed:@"Background_TextField"]];
    registerPassword.secureTextEntry = YES;
    registerPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    registerPassword.autocapitalizationType = UITextAutocapitalizationTypeWords;
    registerPassword.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    registerPassword.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    registerPassword.delegate = self;
    [registerView addSubview:registerPassword];
    
    // Display password confirmation Textfield
    registerCfmPassword = [[UITextField alloc] initWithFrame:CGRectMake(10,160,240,30)];
    registerCfmPassword.placeholder = @"Re-enter Password";
    registerCfmPassword.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];;
    registerCfmPassword.leftViewMode = UITextFieldViewModeAlways;
    registerCfmPassword.backgroundColor = [UIColor greenColor];
    registerCfmPassword.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [registerCfmPassword setBackground:[UIImage imageNamed:@"Background_TextField"]];
    registerCfmPassword.secureTextEntry = YES;
    registerCfmPassword.autocorrectionType = UITextAutocorrectionTypeNo;
    registerCfmPassword.autocapitalizationType = UITextAutocapitalizationTypeWords;
    registerCfmPassword.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    registerCfmPassword.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    registerCfmPassword.delegate = self;
    [registerView addSubview:registerCfmPassword];
    
    // Display fullName Textfield
    registerName = [[UITextField alloc] initWithFrame:CGRectMake(10,210,240,30)];
    registerName.placeholder = @"Full Name";
    registerName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [registerName setBackground:[UIImage imageNamed:@"Background_TextField"]];
    registerName.backgroundColor = [UIColor greenColor];
    registerName.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];;
    registerName.leftViewMode = UITextFieldViewModeAlways;
    registerName.autocorrectionType = UITextAutocorrectionTypeNo;
    registerName.autocapitalizationType = UITextAutocapitalizationTypeWords;
    registerName.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    registerName.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    registerName.delegate = self;
    [registerView addSubview:registerName];
    //[registerName becomeFirstResponder];
    
    UILabel *sixFive = [[UILabel alloc]initWithFrame:CGRectMake(10, 260, 40, 30)];
    sixFive.text = @"+65";
    sixFive.textAlignment = NSTextAlignmentLeft;
    sixFive.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    [registerView addSubview:sixFive];
    
    // Display Contact Number Textfield
    registerContactNo = [[UITextField alloc] initWithFrame:CGRectMake(50,260,200,30)];
    registerContactNo.placeholder = @"Contact Numeber";
    registerContactNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [registerContactNo setBackground:[UIImage imageNamed:@"Background_TextField"]];
    registerContactNo.backgroundColor = [UIColor greenColor];
    registerContactNo.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 30)];;
    registerContactNo.leftViewMode = UITextFieldViewModeAlways;
    registerContactNo.autocorrectionType = UITextAutocorrectionTypeNo;
    registerContactNo.autocapitalizationType = UITextAutocapitalizationTypeWords;
    registerContactNo.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:18];
    registerContactNo.textColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:1.0];
    registerContactNo.delegate = self;
    registerContactNo.keyboardType = UIKeyboardTypeNumberPad;
    [registerView addSubview:registerContactNo];
    //[registerContactNo becomeFirstResponder];
    
    
    
    // display login button
    btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnRegister.frame = CGRectMake((registerView.frame.size.width-160)/2, 310, 160, 30);
    [btnRegister setTitleColor:colorText forState:UIControlStateNormal];
    [btnRegister setTitle:@"Register Now" forState:UIControlStateNormal];
    [btnRegister setEnabled:YES];
    UIImage *image = [UIImage imageNamed:@"Button_Grey"];
    [btnRegister setBackgroundImage:image forState:UIControlStateNormal];
    [btnRegister addTarget:self action:@selector(registerButtonTap) forControlEvents:UIControlEventTouchDown];
    [registerView addSubview:btnRegister];
    
}

-(void) dismissRegisterView
{
    [sideView removeFromSuperview];
    [registerView removeFromSuperview];
}

// This method will be called when the user information has been fetched
- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    defaults = [NSUserDefaults standardUserDefaults];
    
    profilePictureView.profileID = user.id;
    // save as UIImage in NSUserdefaults
    UIImage *fbImage = nil;
    for (NSObject *obj in [profilePictureView subviews]) {
        if ([obj isMemberOfClass:[UIImageView class]]) {
            UIImageView *imgView = (UIImageView *)obj;
            fbImage = imgView.image;
        }
    }
    NSData *imgData = UIImageJPEGRepresentation(fbImage, 100);
    
    lblFBname.text = user.name;
    
    // storing fb logged in user in NSUserDefaults
    [defaults setObject:imgData forKey:@"fbProfileImage"];
    [defaults setObject:lblFBname.text forKey:@"username"];
    [defaults setObject:[user objectForKey:@"email"] forKey:@"email"];
    
    // Begin checking if user exist and login/register
    NSString *email = [defaults stringForKey:@"email"];
    //NSString *fullName = [defaults stringForKey:@"username"];
    
    if(email!=NULL && ![email isEqualToString:@""]){
        [ApplicationDelegate.spEngine checkEmailExistWithEmail:email onCompletion:^(NSDictionary *result){
            NSString *successMsg = [result objectForKey:@"success"];
            NSString *errorMsg = [result objectForKey:@"error"];
            if(successMsg !=NULL && ![successMsg isEqualToString:@""]){
                // Facebook login user with email
                [ApplicationDelegate.spEngine facebookLoginUserWithEmail:email onCompletion:^(NSDictionary *result){
                    NSString *apikey = [result objectForKey:@"apikey"];
                    NSString *email1 = [result objectForKey:@"email"];
                    NSLog(@"APIKEY= %@",result);
                    if(apikey !=NULL && ![apikey isEqualToString:@""])
                    {
                        defaults = [NSUserDefaults standardUserDefaults];
                        [defaults setObject:email1 forKey:@"email"];
                        [defaults setObject:apikey forKey:@"apikey"];
                        MainViewController *mainViewController = [[MainViewController alloc]init];
                        [self presentViewController:mainViewController animated:YES completion:^(void){
                        }];
                    }
                    else
                    {
                        NSString *error = [result objectForKey:@"error"];
                        NSLog(@"Error: %@",error);
                    }
                }];
            }else if(errorMsg !=NULL && ![errorMsg isEqualToString:@""]){
                // REGISTER WITH EMAIL AND USERNAME
                [self newRegistrationButtonTap:nil];
                registerEmail.text = [user objectForKey:@"email"];
                registerName.text = lblFBname.text;
            }
        }];
    }
}

// Implement the loginViewShowingLoggedInUser: delegate method to modify your app's UI for a logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    lblFBstatus.text = @"You're logged in as";
    
    //MainViewController *mainView = [[MainViewController alloc]init];
    //[self presentViewController:mainView animated:YES completion:nil];
}

// Implement the loginViewShowingLoggedOutUser: delegate method to modify your app's UI for a logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    profilePictureView.profileID = nil;
    lblFBname.text = @"";
    lblFBstatus.text= @"You're not logged in!";
    
    // clearing NSUserDefaults
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

// You need to override loginView:handleError in order to handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures since that happen outside of the app.
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

// Moving of UITextfield when keyboard is present
#define kOFFSET_FOR_KEYBOARD 80.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (registerView.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (registerView.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (registerView.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (registerView.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:registerContactNo])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (registerView.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
    if ([sender isEqual:registerName])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (registerView.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = registerView.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    registerView.frame = rect;
    [UIView commitAnimations];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
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
