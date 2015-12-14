//
//  AREndPointSwitch.h
//  Pods
//
//  Created by Alex M Reynolds on 12/14/15.
//
//

@import UIKit;

extern NSString *kAREndpointChangedNotification;

extern const NSString *kAREndpointOptionEndPoints;
extern const NSString *kAREndpointOptionTriggerAction;
extern const NSString *kAREndpointOptionCurrentEndpoint;


@protocol AREndpointSwitchDelegate;

typedef NS_OPTIONS(NSInteger, AREndpointTriggerActionType){
    AREndpointActionLongPress,
    AREndpointAction2FingerTap,
    AREndpointAction3FingerTap,
    AREndpointAction4FingerTap,
    AREndpointActionTap5Times
};

@interface AREndPointSwitch : NSObject
@property (nonatomic, weak) id <AREndpointSwitchDelegate> delegate;
+ (instancetype)initWithOptions:(NSDictionary*)options;
- (void)setEndpoints:(NSArray*)endpoints;
- (void)setCurrentEndpoints:(NSString*)endpoint;

@end

@protocol AREndpointSwitchDelegate <NSObject>
/**
 *  @abstract called when the user has selected a new endpoint
 *  @param @c NSString the new url to use
 */
- (void)endpointUpdated:(NSString*)endpoint;

@end