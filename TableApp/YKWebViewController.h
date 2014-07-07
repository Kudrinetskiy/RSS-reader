//
//  YKWebViewController.h
//  TableApp
//
//  Created by admin on 07.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKWebViewController : UIViewController

@property (strong, nonatomic) NSString * url;
@property (weak, nonatomic) IBOutlet UIWebView * webview;

@end
