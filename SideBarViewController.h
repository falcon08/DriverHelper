//
//  SideBarViewController.h
//  DriverHelper
//
//  Created by Sanchir Kartiev on 31/08/2014.
//  Copyright (c) 2014 Sanchir Kartiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SideBarViewController : UIViewController<UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *menuItems;
@property IBOutlet UITableView *tableView;

@end
