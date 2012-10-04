//
//  MADViewController.h
//  UXOBrowser
//
//  Created by Jerry Redfern on 10/2/12.
//  Copyright (c) 2012 Jerry Redfern. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
- (IBAction)bookmarkTap:(UIBarButtonItem *)sender;

@end
