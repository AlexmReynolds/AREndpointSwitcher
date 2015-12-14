//
//  AREEndpointsTableViewController.h
//  Pods
//
//  Created by Alex M Reynolds on 12/14/15.
//
//

#import <UIKit/UIKit.h>
@protocol AREEndPointTableViewDelete;

@interface AREEndpointsTableViewController : UITableViewController
@property (nonatomic, weak) id <AREEndPointTableViewDelete> owner;
@property (nonatomic, strong) NSString *selectedEndpoint;
@property (nonatomic, strong) NSArray *options;

@end

@protocol AREEndPointTableViewDelete <NSObject>

- (void)endPointSelected:(NSString*)endpoint;

@end