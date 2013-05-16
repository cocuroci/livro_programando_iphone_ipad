//
//  ViewController.h
//  BookCoreLocation
//
//  Created by André Cocuroci on 16/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "CustomAnotation.h"

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *myLocationManager;
    CLLocation *localizacaoDeSaida;
    BOOL isDentro;
}

@property (nonatomic, strong) IBOutlet UILabel *labelLatitude;
@property (nonatomic, strong) IBOutlet UILabel *labelLongitude;
@property (nonatomic, strong) IBOutlet UILabel *labelAltitude;
@property (nonatomic, strong) IBOutlet UILabel *labelPrecisaoHorizontal;
@property (nonatomic, strong) IBOutlet UILabel *labelPrecisaoVertical;
@property (nonatomic, strong) IBOutlet UILabel *labelDistanciaPercorrida;
@property (nonatomic, strong) IBOutlet MKMapView *myMapView;

- (IBAction)openCurrentPosition;
- (IBAction)openBackRout;

@end
