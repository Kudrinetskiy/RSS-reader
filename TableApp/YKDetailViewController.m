//
//  YKDetailViewController.m
//  TableApp
//
//  Created by admin on 04.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "YKDetailViewController.h"
#import "YKWebViewController.h"


@interface YKDetailViewController ()
@end

@implementation YKDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    if (!_feed)
        return;
    
    self.newsTitle.text = [self.feed objectForKey:@"title"];
    self.newsText.text = [self.feed objectForKey:@"description"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"GoWeb"]) {
        NSString * url = [self.feed objectForKey:@"link"];
        [segue.destinationViewController setUrl:url];
        
    }
}

@end
