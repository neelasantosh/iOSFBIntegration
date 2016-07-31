//
//  ViewController.m
//  AroundMe
//
//  Created by Rajesh on 18/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize fbLoginButton,fbProfilePicture,textEmail,textName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    fbLoginButton.readPermissions = [[NSArray alloc]initWithObjects:@"email",@"public_profile",@"user_birthday",@"user_hometown", nil];
    fbLoginButton.delegate = self;
    
    //get publish permissions
    if ([[FBSDKAccessToken currentAccessToken] hasGranted:@"publish_actions"])
    {
        NSLog(@"already had permissions");
    }
    else//ask for permissions
    {
        FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc ]init];
        NSArray *permissionArray = [[NSArray alloc]initWithObjects:@"publish_actions",nil];
        [loginManager logInWithPublishPermissions:permissionArray handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
            NSLog(@"publish permission result:%@,error:%@",result.token.permissions,error);
        }];
    }
    
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    NSLog(@"Login Result:%@,error:%@",result,error);
    
    NSLog(@"UserId:%@,permissions:%@",result.token.userID,result.token.permissions);
    //fetch user profile Data
    NSMutableDictionary *userParamDictionary = [[NSMutableDictionary alloc]init];
    [userParamDictionary setObject:@"id,name,email,birthday,hometown" forKey:@"fields"];
    
    //check if value token is valid
    if ([FBSDKAccessToken currentAccessToken]) {
        //create data request
        
        FBSDKGraphRequest *dbRequest = [[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:userParamDictionary];
        [dbRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
        {
            NSLog(@"result:%@",result);
            textName.text = [result objectForKey:@"name"];
            textEmail.text = [result objectForKey:@"email"];
            //save login result in userdefaults
            NSUserDefaults *def= [NSUserDefaults standardUserDefaults];
            [def setObject:result forKey:@"login_result"];
            [def synchronize];
        }];
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    NSLog(@"LogOut");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToHome:(id)sender {
}
@end
