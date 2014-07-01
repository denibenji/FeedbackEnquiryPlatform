//
//  StartViewController.h
//  PublicFeedback
//
//  Created by Ben Chan on 28/4/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"

@interface StartViewController : UIViewController{
    UIScrollView *registerView;
}

@property (nonatomic, strong)UITextField *loginUserName;
@property (nonatomic, strong)UITextField *loginPassword;
@property (nonatomic, strong)UITextField *registerEmail;
@property (nonatomic, strong)UITextField *registerPassword;
@property (nonatomic, strong)UITextField *registerCfmPassword;
@property (nonatomic, strong)UITextField *registerName;
@property (nonatomic, strong)UITextField *registerContactNo;

@property(nonatomic, strong)UIView *sideView;
@property (nonatomic, strong)UIView *loginView;

@property (nonatomic, strong) UIColor *colorText;
@property (nonatomic, strong) UIFont *fontHeader;
@property (nonatomic, strong) UIFont *fontText;
@property (strong, nonatomic) NSUserDefaults *defaults;
@property (strong, nonatomic) FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) UILabel *lblFBname;
@property (strong, nonatomic) UILabel *lblFBstatus;
@property (strong, nonatomic) UIButton *btnRegister;

@end
