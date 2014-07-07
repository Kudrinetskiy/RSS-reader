//
//  YKDetailViewController.h
//  TableApp
//
//  Created by admin on 04.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKDetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary * feed;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UITextView *newsText;

@end
