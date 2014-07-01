//
//  AppDelegate.h
//  PublicFeedback
//
//  Created by Ben Chan on 28/4/14.
//  Copyright (c) 2014 IS480_FYP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SPEngine.h"
#import <CoreData/CoreData.h>

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UIManagedDocument *spDatabase;

@property (strong, nonatomic) SPEngine *spEngine;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
//- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView;

@end
