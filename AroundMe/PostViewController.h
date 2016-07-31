//
//  PostViewController.h
//  AroundMe
//
//  Created by Rajesh on 18/12/15.
//  Copyright © 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelUser;

@property (strong, nonatomic) IBOutlet UITextView *textViewPost;

- (IBAction)postOnWall:(id)sender;

@end
