//
//  TTInternetConnection.h
//  InternetConnection
//
//  Created by Victor Chirino on 2/6/14.
//  Copyright (c) 2014 Tictapps. All rights reserved.
//


#import <Foundation/Foundation.h>

@class Reachability;
@interface TTInternetConnection : NSObject

typedef enum {
    TTConnectionNone = 0,    // Sin Conexión
    TTConnectionWiFi,        // Conexión via WiFi
    TTConnection3G           // Conexión por 3G
} TTConnectionType;

// Host para saber si hay internet. Por defecto www.google.com.ar

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;
@property (nonatomic) Reachability *wifiReachability;

// Status de la conexión
@property (nonatomic) TTConnectionType statusOfConnection;

// Nombre/Página del host
@property (nonatomic) NSString *hostName;


+ (TTInternetConnection *)sharedInstance;

- (TTConnectionType)typeOfConnection;

// Sirve para ver si hay conexión a internet
- (BOOL)internetAccess;
 // Sirve para ver si hay conexión vía WiFi
- (BOOL)accessViaWifi;

@end
