//
//  ViewController.h
//  MovementTracker
//
//  Created by Prajeet Shrestha on 4/13/15.
//  Copyright (c) 2015 Prajeet Shrestha. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet UILabel *initialLocation;

@property (weak, nonatomic) IBOutlet UILabel *currentLocation;
@property (weak, nonatomic) IBOutlet UIButton *rest;
@property (weak, nonatomic) IBOutlet UILabel *horizontalAccuracy;
@end

