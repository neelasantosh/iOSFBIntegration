//
//  ViewController.h
//  AroundMe
//
//  Created by Rajesh on 18/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface ViewController : UIViewController<FBSDKLoginButtonDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textName;
@property (strong, nonatomic) IBOutlet UITextField *textEmail;
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *fbLoginButton;
@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *fbProfilePicture;
- (IBAction)goToHome:(id)sender;

@end

