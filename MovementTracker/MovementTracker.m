//
//  ViewController.m
//  MovementTracker
//
//  Created by Prajeet Shrestha on 4/13/15.
//  Copyright (c) 2015 Prajeet Shrestha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CLLocation *beginningLocation;
    double distance;
    int delegateCallCount;
}

@property int seconds;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) NSMutableArray *locations;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.seconds = 0;
    
    delegateCallCount = 0;
    
    self.locations = [NSMutableArray array];
    
    [self startLocationUpdates];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)startLocationUpdates
{
    if (self.locationManager == nil)
    {
        self.locationManager = [CLLocationManager new];
    }
    
    self.locationManager.delegate = self;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    self.locationManager.activityType = CLActivityTypeAutomotiveNavigation;
    
    [self.locationManager startUpdatingLocation];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    delegateCallCount ++;
    
    
    CLLocation *lastLocationFoundOut = locations.lastObject;
    
    if (lastLocationFoundOut.horizontalAccuracy <= 3)
    {
        if (beginningLocation == nil)
        {
            
            beginningLocation = locations.lastObject;
            
            if (beginningLocation.horizontalAccuracy <= 10)
            {
                beginningLocation = locations.lastObject;
                self.statusLabel.text = @"Found the location";
                
                self.initialLocation.text = [NSString stringWithFormat:@"Lat: %f Lon:%f",beginningLocation.coordinate.latitude,beginningLocation.coordinate.longitude];
            }
            else
            {
                beginningLocation = nil;
                self.statusLabel.text = @"Couldn't Find the location";
            }
            
            distance = 0;
        }
        
    }

    else
    {
        CLLocation *latestLocation = locations.lastObject;
        
        if (latestLocation.horizontalAccuracy <= 10 ) {
            distance = [latestLocation distanceFromLocation:beginningLocation];
            
            self.currentLocation.text = [NSString stringWithFormat:@"Lat: %f Lon:%f",latestLocation.coordinate.latitude,latestLocation.coordinate.longitude];
            
            self.horizontalAccuracy.text = [NSString stringWithFormat:@"%f Horizontal Accuracy",
                                            latestLocation.horizontalAccuracy ];
        }
        

    }
    
    self.count.text = [NSString stringWithFormat:@"%d",delegateCallCount];
    
    self.distanceLabel.text = [NSString stringWithFormat:@"%f",distance];
}

-(void)locationManager: (CLLocationManager *)manager didFailWithError: (NSError*)error
{
    
    //Handle error according to the type of error or give an alert to user.
    
    NSLog(@"Error message – %@",[error description]);
    
}
- (IBAction)reset:(id)sender {
    
    beginningLocation = nil;
    self.distanceLabel.text = @"0";
    self.initialLocation.text = @"0";
    self.currentLocation.text = @"0";
    self.statusLabel.text = @"0";
}


@end
