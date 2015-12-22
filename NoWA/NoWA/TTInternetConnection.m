//
//  TTInternetConnection.m
//  InternetConnection
//
//  Created by Victor Chirino on 2/6/14.
//  Copyright (c) 2014 Tictapps. All rights reserved.
//

#import "TTInternetConnection.h"
#import "Reachability.h"

@implementation TTInternetConnection

TTInternetConnection *sharedInstance;

+ (TTInternetConnection *)sharedInstance {
    static TTInternetConnection *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}
- (id)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        _internetReachability = [Reachability reachabilityForInternetConnection];
        _wifiReachability = [Reachability reachabilityForLocalWiFi];
        _hostReachability = [Reachability reachabilityWithHostName:@"http://www.google.com.ar/"];

        [self updateInterfaceWithReachability:_internetReachability];
        [self updateInterfaceWithReachability:_wifiReachability];
    }

    return self;
}

- (void)setHostName:(NSString *)hostName {
    _hostReachability = [Reachability reachabilityWithHostName:hostName];
}

- (BOOL)internetAccess {

    [self.internetReachability startNotifier];
    NetworkStatus internetStatus = [_internetReachability currentReachabilityStatus];
    BOOL connectionRequired = [_internetReachability connectionRequired];

    if (internetStatus != NotReachable && !connectionRequired) {
        //Have Access
        return YES;
    }
    else {
        //No internet
        return NO;
    }
}

- (BOOL)accessViaWifi {
    if (![self internetAccess]){
        return NO;
    }else{
        NetworkStatus status = [_wifiReachability currentReachabilityStatus];
        BOOL connectionRequired = [_internetReachability connectionRequired];
        if (status == ReachableViaWiFi && !connectionRequired){
            return YES;
        }
    }
    return NO;
}


- (TTConnectionType)typeOfConnection {
    if (![self internetAccess]){
        return TTConnectionNone;
    }else{
        if ([self accessViaWifi]){
            return TTConnectionWiFi;
        }
    }
    return TTConnection3G;
}

- (void)reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{

    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    switch (netStatus)
    {
        case NotReachable:        {
            _statusOfConnection = TTConnectionNone;
            break;
        }

        case ReachableViaWWAN:        {
            _statusOfConnection = TTConnection3G;
            break;
        }
        case ReachableViaWiFi:        {
            _statusOfConnection = TTConnectionWiFi;
            break;
        }
    }
    if (connectionRequired)
    {
        _statusOfConnection = TTConnectionNone;
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
}

@end
