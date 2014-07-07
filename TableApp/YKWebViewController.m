//
//  YKWebViewController.m
//  TableApp
//
//  Created by admin on 07.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "YKWebViewController.h"


@interface YKWebViewController ()

@end

@implementation YKWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL * myURL = [NSURL URLWithString:[self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest * request = [NSURLRequest requestWithURL:myURL];
    [self.webview loadRequest:request];
    
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(home:)];
    self.navigationItem.leftBarButtonItem = newBackButton;
}

-(void)home:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
