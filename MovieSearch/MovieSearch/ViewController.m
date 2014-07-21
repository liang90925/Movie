//
//  ViewController.m
//  MovieSearch
//
//  Created by Chun-Ling Chen on 7/19/14.
//  Copyright (c) 2014 Chun-Ling Chen. All rights reserved.
//

#import "ViewController.h"
#import "detailView1.h"
#import "Details.h"

@interface ViewController ()


@end

@implementation ViewController {
    NSMutableArray *tableData;
    NSString *string1;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    cameraTableView.dataSource = self;
    cameraTableView.delegate = self;

    string1 = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://www.yahoo.com/movies/showtimes"] encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *moviesList[10];
    NSString *theaterList[5], *address[5];
    
    NSString *string = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.fandango.com/moviesintheaters"] encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *components = [string componentsSeparatedByString:@"mega-menu-movie-list\">"];
    
    NSString *query = [components objectAtIndex:1];
    
    NSString *query1 = [components objectAtIndex:2];
    
    NSArray *components1, *components2;
    NSString *query2;
    
    components1= [query componentsSeparatedByString:@"\">"];
    
    for (int i=0; i<10; i++) {
        
        query2 = [components1 objectAtIndex:(i+1)];
        
        components2 = [query2 componentsSeparatedByString:@"<"];
        
        moviesList[i] = [components2 objectAtIndex:0];
    }
    
    NSArray *components3 = [string1 componentsSeparatedByString:@"<script>YMedia = YUI"];
    
    NSString *query3 = [components3 objectAtIndex:1];
    
    NSArray *components4 = [query3 componentsSeparatedByString:@"\"id\""];
    
    theaterList[0] = [components4 objectAtIndex:1];
    
    
    NSArray *components5 = [theaterList[0] componentsSeparatedByString:@"\"address\":\""];
    
    NSString *query4 = [components5 objectAtIndex:1];
    
    NSArray *components6 = [query4 componentsSeparatedByString:@"\","];
    
    address[0] = [components6 objectAtIndex:0];
    
//    NSLog(@"%@", moviesList[0]);
    NSLog(@"%@", address[0]);
    
    tableData = [NSMutableArray arrayWithObjects:moviesList[0], moviesList[1], moviesList[2], moviesList[3], moviesList[4], moviesList[5], moviesList[6], moviesList[7], moviesList[8], moviesList[9], nil];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"tableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee.jpg"];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
//    NSLog(@"%@", string1);
    
    if ([segue.identifier isEqualToString:@"detailViewID"]) {
        
        NSIndexPath *index =[cameraTableView indexPathForSelectedRow];
        
        Details *details = [[Details alloc]init];
        details.title = [tableData objectAtIndex:index.row];
        
        //NSLog(@"index %d %@",index.row,title);
        [[segue destinationViewController] setDetails:details];
    
        
        
    }
}


@end
