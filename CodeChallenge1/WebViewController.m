//
//  WebViewController.m
//  CodeChallenge1
//
//  Created by CHRISTINA GUNARTO on 10/23/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlString = @"http://www.mobilemakers.co";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:requestURL];

}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
}



@end
