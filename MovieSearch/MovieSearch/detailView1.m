//
//  detailView1.m
//  MovieSearch
//
//  Created by Chun-Ling Chen on 7/19/14.
//  Copyright (c) 2014 Chun-Ling Chen. All rights reserved.
//

#import "detailView1.h"

@interface detailView1 ()

@end

@implementation detailView1

@synthesize displayLabel,displayName,details;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    displayLabel.text = details.title;
    NSLog(@"%@",displayName);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
