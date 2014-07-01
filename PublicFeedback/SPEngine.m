//
//  SPEngine.m
//  PublicFeedback
//
//  Created by Ben Chan on 3/6/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//

#import "SPEngine.h"

@implementation SPEngine


-(NSString *) getDeviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [[UIDevice currentDevice] name];
}

-(MKNetworkOperation*) loginUserWithPassword:(NSString*) password
                                    withEmail:(NSString*) email
                                onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:password forKey:@"password"];
    [params setObject:email forKey:@"email"];
    [params setObject:[self getDeviceName] forKey:@"device"];
    
    NSString *path = @"api/useraccount/login";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)facebookLoginUserWithEmail:(NSString *) email
                                     onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:email forKey:@"email"];
    [params setObject:[self getDeviceName] forKey:@"device"];
    
    NSString *path = @"api/useraccount/facebook_login";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)logoutUserWithAPIKey:(NSString *) apikey
                               onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:apikey forKey:@"apikey"];
    
    NSString *path = @"api/useraccount/logout";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)registerUserWithEmail:(NSString *) email
                                withPassword:(NSString *) password
                                withFullName:(NSString *) fullName
                              withContactNum:(int) contactNumber
                                withUserType:(int) userType
                                onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:email forKey:@"email"];
    [params setObject:password forKey:@"password"];
    [params setObject:fullName forKey:@"fullName"];
    [params setObject:[NSString stringWithFormat:@"%d",contactNumber] forKey:@"contactNumber"];
    [params setObject:[NSString stringWithFormat:@"%d",userType] forKey:@"userType"];
    
    NSString *path = @"api/useraccount/register_account";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)authenticateAccountWithSMSKey:(NSString *) smsKey
                                        onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:smsKey forKey:@"smsKey"];
    NSString *path = @"api/useraccount/authenticate_SMSkey";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}


-(MKNetworkOperation *)getSessionDeviceWithAPIKey:(NSString *) apikey
                                     onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:apikey forKey:@"apikey"];
    
    NSString *path = @"api/useraccount/get_session_device_name";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)checkEmailExistWithEmail:(NSString *) email
                                   onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:email forKey:@"email"];
    
    NSString *path = @"api/useraccount/isEmailExist";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}

-(MKNetworkOperation *)retrieveUserWithAPIKey:(NSString *) apikey
                                onCompletion:(NSDictionaryResponseBlock) completionBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:apikey forKey:@"apikey"];
    
    NSString *path = @"api/useraccount/get_user";
    MKNetworkOperation *op = [self operationWithPath:path
                                              params:[params copy]
                                          httpMethod:@"POST"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         NSDictionary *result = [[NSDictionary alloc] init];
         
         if ([completedOperation HTTPStatusCode] == 200)
         {
             result = [completedOperation responseJSON];
         }
         else
         {
             NSLog(@"Not 200");
         }
         
         DLog(@"%@", [completedOperation responseString]);
         completionBlock(result);
         
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError* error) {
         
         MKNKErrorBlock errorBlock = ^(NSError* error) {
             DLog(@"%@\t%@\t%@\t%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]);
         };
         errorBlock(error);
     }];
    [self enqueueOperation:op];
    return op;
}



@end
