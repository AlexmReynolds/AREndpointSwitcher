//
//  AREViewController.m
//  AREndPointSwitch
//
//  Created by Alex M Reynolds on 12/14/2015.
//  Copyright (c) 2015 Alex M Reynolds. All rights reserved.
//

#import "AREViewController.h"
#import "AREndPointSwitch.h"

@interface AREViewController ()
@property (nonatomic, strong) AREndPointSwitch *eps;
@end

@implementation AREViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.eps = [AREndPointSwitch initWithOptions:@{kAREndpointOptionEndPoints : @[@"foo", @"bar"], kAREndpointOptionCurrentEndpoint : @"bar", kAREndpointOptionTriggerAction : @(AREndpointAction2FingerTap)}];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed:) name:kAREndpointChangedNotification object:nil];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)changed:(NSNotification*)notification
{
    NSLog(@"endpoint %@",notification.object);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
