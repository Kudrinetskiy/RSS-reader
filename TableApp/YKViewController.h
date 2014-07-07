//
//  YKViewController.h
//  TableApp
//
//  Created by admin on 04.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKViewController : UIViewController <NSXMLParserDelegate, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@end
