# AREndPointSwitch

[![CI Status](http://img.shields.io/travis/AlexmReynolds/AREndpointSwitcher.svg?style=flat)](https://travis-ci.org/AlexmReynolds/AREndpointSwitcher)
[![Version](https://img.shields.io/cocoapods/v/AREndPointSwitch.svg?style=flat)](http://cocoapods.org/pods/AREndPointSwitch)
[![License](https://img.shields.io/cocoapods/l/AREndPointSwitch.svg?style=flat)](http://cocoapods.org/pods/AREndPointSwitch)
[![Platform](https://img.shields.io/cocoapods/p/AREndPointSwitch.svg?style=flat)](http://cocoapods.org/pods/AREndPointSwitch)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

In the view that you want to be able to trigger the endpoint switch from, you will need to instantiate a switcher
```objc
[AREndPointSwitch initWithOptions:@{kAREndpointOptionEndPoints : @[@"foo", @"bar"], kAREndpointOptionCurrentEndpoint : @"bar", kAREndpointOptionTriggerAction : @(AREndpointAction2FingerTap)}];
```

By default the trigger action is 2 finger tap. 
You can listen for changes via NSNoticiationCenter
```objc
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changed:) name:kAREndpointChangedNotification object:nil];

- (void)changed:(NSNotification*)notification
{
    NSLog(@"endpoint %@",notification.object);
}
```
OR you can use the delegate

```objc
- (void)endpointUpdated:(NSString *)endpoint
{
    
}
```

The point of the notification is that you could load this class in the AppDelegate and any view in the app can launch the picker.



## Requirements

## Installation

AREndPointSwitch is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AREndPointSwitch"
```

## Author

Alex M Reynolds, alex.michael.reynolds@gmail.com

## License

AREndPointSwitch is available under the MIT license. See the LICENSE file for more info.
