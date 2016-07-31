//
//  PostViewController.m
//  AroundMe
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import "PostViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface PostViewController ()

@end

@implementation PostViewController
@synthesize labelUser,textViewPost;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //get username from userdefaults
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    NSString *name = [[userDef objectForKey:@"login_result"]objectForKey:@"name"];
    labelUser.text = name;
    
    
    
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

- (IBAction)postOnWall:(id)sender
{
    //check publish permission and post message
    if ([[FBSDKAccessToken currentAccessToken]hasGranted:@"publish_actions"]) {
        
        NSMutableDictionary *msgDictionary = [[NSMutableDictionary alloc]init];
        [msgDictionary setObject:textViewPost.text forKey:@"message"];
        
        FBSDKGraphRequest *fbRequest = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me/feed" parameters:msgDictionary HTTPMethod:@"POST"];
        
        [fbRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
           
            NSLog(@"postResult:%@,postError:%@",result,error);
            
            
        }
         ];
    }
    
    
}
@end
