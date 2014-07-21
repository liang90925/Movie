//
//  ViewController.h
//  MovieSearch
//
//  Created by Chun-Ling Chen on 7/19/14.
//  Copyright (c) 2014 Chun-Ling Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *cameraTableView;
    
}


@end
