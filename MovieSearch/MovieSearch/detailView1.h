//
//  detailView1.h
//  MovieSearch
//
//  Created by Chun-Ling Chen on 7/19/14.
//  Copyright (c) 2014 Chun-Ling Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Details.h"

@interface detailView1 : UIViewController
{
   // UILabel *displayLabel;
    NSString *displayName;
    Details *details;
}

@property (strong, nonatomic) NSString *displayName;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) Details *details;

@end
