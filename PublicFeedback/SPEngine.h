//
//  SPEngine.h
//  PublicFeedback
//
//  Created by Ben Chan on 3/6/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkEngine.h"
#include <sys/utsname.h> // For finding out device name

typedef void (^NSDictionaryResponseBlock)(NSDictionary *key);
typedef void (^MKNKImageBlock) (UIImage* fetchedImage, NSURL* url, BOOL isInCache);

@interface SPEngine : MKNetworkEngine

//useraccount: auth_validate(apikey), login(email, password, device), logout(apikey), get_user(apikey), register_account(email, password, fullName, contactNumber, userType), authenticate_SMSkey(smsKey), get_session_device_name(apikey), isEmailExist(email)

-(MKNetworkOperation *)authenticateSessionWithAPIKey:(NSString *) apikey
                                onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)loginUserWithPassword:(NSString *) password
                                    withEmail:(NSString *) email
                                onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)facebookLoginUserWithEmail:(NSString *) email
                                onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)logoutUserWithAPIKey:(NSString *) apikey
                                onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)registerUserWithEmail:(NSString *) email
                                withPassword:(NSString *) password
                                withFullName:(NSString *) fullName
                              withContactNum:(int) contactNumber
                                withUserType:(int) userType
                                onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)authenticateAccountWithSMSKey:(NSString *) smsKey
                                        onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)getSessionDeviceWithAPIKey:(NSString *) apikey
                                        onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)checkEmailExistWithEmail:(NSString *) email
                                        onCompletion:(NSDictionaryResponseBlock) completionBlock;

-(MKNetworkOperation *)retrieveUserWithAPIKey:(NSString *) apikey
                                   onCompletion:(NSDictionaryResponseBlock) completionBlock;


@end
