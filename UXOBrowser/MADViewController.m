//
//  MADViewController.m
//  UXOBrowser
//
//  Created by Jerry Redfern on 10/2/12.
//  Copyright (c) 2012 Jerry Redfern. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
@synthesize webView;
@synthesize toolbar;
@synthesize spinner;

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //Check to see if connected to Interwebs and Error alert if not
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error loading web page"
                                                      message:[error localizedDescription] 
                                                     delegate:self
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"Okey-Dokey", nil];
                                            [alertView show]; 
}


-(void)loadWebPageWithString:(NSString *)urlString

{
	NSURL *url = [NSURL URLWithString:urlString]; 
	NSURLRequest *request = [NSURLRequest requestWithURL:url]; 
	[webView loadRequest:request]; 
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    webView.delegate=self;
    [self loadWebPageWithString:@"http://jerryredfern.com"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setToolbar:nil];
    [self setSpinner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)bookmarkTap:(UIBarButtonItem *)sender {
    
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil
                                                         delegate:self
                                                cancelButtonTitle:@"Cancel"
                                           destructiveButtonTitle:nil
                                                otherButtonTitles:@"Karen Coates", @"UXOLao", @"WHWV", @"Legacies of War", @"UXO in Sierra", @"Jerry Redfern", nil];
    [actionSheet showFromToolbar:toolbar];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger) buttonIndex
{
	if(buttonIndex==0)
	{
		[self loadWebPageWithString:@"http://karencoates.com"];
	}
	else if (buttonIndex==1)
	{
		[self loadWebPageWithString:@"http://www.uxolao.org"];
	}
	else if (buttonIndex==2)
	{
		[self loadWebPageWithString:@"http://www.wehelpwarvictims.org/"];
	}
    else if (buttonIndex==3)
    {
        [self loadWebPageWithString:@"http://legaciesofwar.org/"];
    }
    else if (buttonIndex==4)
    {
        [self loadWebPageWithString:@"http://www.sierraclub.org/sierra/201101/laos.aspx"];
    }
    else if (buttonIndex==5)
    {
        [self loadWebPageWithString:@"http://jerryredfern.com"];
    }
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
	[spinner startAnimating]; 
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
	[spinner stopAnimating]; 
}







@end
