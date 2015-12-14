//
//  AREndPointSwitch.m
//  Pods
//
//  Created by Alex M Reynolds on 12/14/15.
//
//

#import "AREndPointSwitch.h"
#import "AREEndpointsTableViewController.h"

const NSString *kAREndpointChangedNotification      = @"kAREndpointChangedNotification";
const NSString *kAREndpointOptionEndPoints          = @"kAREndpointOptionEndPoints";
const NSString *kAREndpointOptionTriggerAction      = @"kAREndpointOptionTriggerAction";
const NSString *kAREndpointOptionCurrentEndpoint    = @"kAREndpointOptionCurrentEndpoint";

@interface AREndPointSwitch ()<AREEndPointTableViewDelete>
@property (nonatomic, strong) NSMutableDictionary* options;
@property (nonatomic, strong) UIGestureRecognizer *gesture;
@property (nonatomic, strong) AREEndpointsTableViewController *controller;
@end
@implementation AREndPointSwitch

+ (instancetype)initWithOptions:(NSDictionary*)options
{
    AREndPointSwitch *endpoint = [[AREndPointSwitch alloc] init];
    endpoint.options = [NSMutableDictionary dictionaryWithDictionary:options];
    
    
    AREndpointTriggerActionType action = AREndpointAction2FingerTap;
    
    if([options objectForKey:kAREndpointOptionTriggerAction]){
        action = [[options objectForKey:kAREndpointOptionTriggerAction] integerValue];
    }
    [endpoint setupTouchListener:action];
    
    return endpoint;
}
- (void)dealloc
{
    [self.gesture.view removeGestureRecognizer:self.gesture];
}

- (void)setupTouchListener:(AREndpointTriggerActionType)type
{
    NSInteger numberOfTaps = 1;
    NSInteger numberOfTouches = 1;
    UITapGestureRecognizer *tap;
    switch (type) {
        case AREndpointActionLongPress:
            self.gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];

            break;
        case AREndpointAction2FingerTap:
            numberOfTouches = 2;
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];
            tap.numberOfTouchesRequired = numberOfTouches;
            tap.numberOfTapsRequired = numberOfTaps;
            self.gesture = tap;
            break;
        case AREndpointAction3FingerTap:
            numberOfTouches = 3;
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];
            tap.numberOfTouchesRequired = numberOfTouches;
            tap.numberOfTapsRequired = numberOfTaps;
            self.gesture = tap;
            break;
        case AREndpointAction4FingerTap:
            numberOfTouches = 4;
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];
            tap.numberOfTouchesRequired = numberOfTouches;
            tap.numberOfTapsRequired = numberOfTaps;
            self.gesture = tap;
            break;
        case AREndpointActionTap5Times:
            numberOfTaps = 5;
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];
            tap.numberOfTouchesRequired = numberOfTouches;
            tap.numberOfTapsRequired = numberOfTaps;
            self.gesture = tap;
            
            break;
        default:
            tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureFired:)];
            tap.numberOfTouchesRequired = numberOfTouches;
            tap.numberOfTapsRequired = numberOfTaps;
            self.gesture = tap;
            break;
    }
    
    [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:self.gesture];
    
}

#pragma mark - Gesture methods
- (void)gestureFired:(UIGestureRecognizer*)gesture
{
    if(self.controller == nil){
        self.controller = [[AREEndpointsTableViewController alloc] init];
        self.controller.owner = self;
        self.controller.options = self.options[kAREndpointOptionEndPoints];
        self.controller.selectedEndpoint = self.options[kAREndpointOptionCurrentEndpoint];
        
        
        UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        [root presentViewController:self.controller animated:YES completion:^{

        }];
    }
}

#pragma mark - TAble Delegate

- (void)endPointSelected:(NSString *)endpoint
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kAREndpointChangedNotification object:endpoint];
    
    [self.controller dismissViewControllerAnimated:YES completion:^{
        self.controller = nil;
    }];
    if([self.delegate respondsToSelector:@selector(endpointUpdated:)]){
        [self.delegate endpointUpdated:endpoint];
    }
}

- (void)setEndpoints:(NSArray *)endpoints
{
    [self.options setObject:endpoints forKey:kAREndpointOptionEndPoints];
}

- (void)setCurrentEndpoints:(NSString*)endpoint
{
    [self.options setObject:endpoint forKey:kAREndpointOptionCurrentEndpoint];
}



@end
