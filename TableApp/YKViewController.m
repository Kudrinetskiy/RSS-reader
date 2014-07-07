//
//  YKViewController.m
//  TableApp
//
//  Created by admin on 04.07.14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "YKViewController.h"
#import "YKImageCell.h"
#import "YKDetailViewController.h"


@interface YKViewController () {
    NSXMLParser * parser;
    NSMutableString * title;
    NSMutableString * link;
    NSMutableString * description;
    NSString * element;
    NSMutableDictionary * item;
    NSMutableArray * feeds;
}

@end

@implementation YKViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    feeds = [[NSMutableArray alloc] init];
    NSURL * url = [NSURL URLWithString:@"https://www.apple.com/main/rss/hotnews/hotnews.rss"];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    if ([elementName isEqualToString:@"item"]) {
        item = [NSMutableDictionary new];
        title = [NSMutableString new];
        link = [NSMutableString new];
        description = [NSMutableString new];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"item"]) {
        [item setObject:title forKey:@"title"];
        [item setObject:link forKey:@"link"];
        [item setObject:description forKey:@"description"];
        [feeds addObject:[item copy]];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([element isEqualToString:@"title"])
        [title appendString:string];
    
    if ([element isEqualToString:@"link"])
        [link appendString:string];
    
    if ([element isEqualToString:@"description"])
        [description appendString:string];
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    [self.table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellId = @"cell";
    YKImageCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.cellLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDetail"]) {
        NSIndexPath * indexPath = [self.table indexPathForSelectedRow];
        [segue.destinationViewController setFeed:[feeds objectAtIndex:indexPath.row]];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSIndexPath * indexPath = [self.table indexPathForSelectedRow];
    
    if (indexPath)
        [self.table deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
