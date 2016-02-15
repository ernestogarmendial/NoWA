//
//  TTInternetConnection.h
//  InternetConnection


#import <Foundation/Foundation.h>

@class Reachability;
@interface TTInternetConnection : NSObject

typedef enum {
    TTConnectionNone = 0,    // Sin Conexión
    TTConnectionWiFi,        // Conexión via WiFi
    TTConnection3G,           // Conexión por 3G
    TTConnectionLTE,        // Conexión via WiFi
    TTConnection2G    // Sin Conexión
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
