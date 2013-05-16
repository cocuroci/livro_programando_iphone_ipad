//
//  ViewController.m
//  BookCoreLocation
//
//  Created by André Cocuroci on 16/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];	
    
    isDentro = YES;
    
    myLocationManager = [[CLLocationManager alloc] init];
    myLocationManager.delegate = self;
    myLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [myLocationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations objectAtIndex:0];
    
    if(localizacaoDeSaida == nil)
    {
        localizacaoDeSaida = location;
        CustomAnotation *myCustomAnotation = [[CustomAnotation alloc] init];
        CLLocationCoordinate2D newLocationCoordinate;
        newLocationCoordinate.latitude = location.coordinate.latitude;
        newLocationCoordinate.longitude = location.coordinate.longitude;
        
        myCustomAnotation.coordinate = newLocationCoordinate;
        myCustomAnotation.title = @"Partida";
        myCustomAnotation.subtitle = @"Seu ponto de partida";
        
        [self.myMapView addAnnotation:myCustomAnotation];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([myCustomAnotation coordinate], 500, 500);
        
        [self.myMapView setRegion:region animated:YES];
    }
    
    CLLocationDistance discancia = [location distanceFromLocation:localizacaoDeSaida];
    NSString *distanciaString = [[NSString alloc] initWithFormat:@"%fm", discancia];
    
    NSString *latitude = [[NSString alloc] initWithFormat:@"%f\u00B0", location.coordinate.latitude];
    NSString *longitude = [[NSString alloc] initWithFormat:@"%f\u00B0", location.coordinate.longitude];
    NSString *altitude = [[NSString alloc] initWithFormat:@"%f", location.altitude];
    NSString *precisaoHorizontal = [[NSString alloc] initWithFormat:@"%f", location.horizontalAccuracy];
    NSString *precisaoVertical = [[NSString alloc] initWithFormat:@"%f", location.verticalAccuracy];
    
    self.labelLatitude.text = latitude;
    self.labelLongitude.text = longitude;
    self.labelAltitude.text = altitude;
    self.labelPrecisaoHorizontal.text = precisaoHorizontal;
    self.labelPrecisaoVertical.text = precisaoVertical;
    self.labelDistanciaPercorrida.text = distanciaString;
    
    if(isDentro && discancia > 50)
    {
        isDentro = NO;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Perímetro" message:@"Saindo do perímetro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    if(!isDentro && discancia < 50)
    {
        isDentro = YES;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Perímetro" message:@"Entrando no perímetro" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorText = error.code == kCLErrorDenied ? @"Acesso negado" : @"Erro ao utilizar o LocationManager";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erro" message:errorText delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openCurrentPosition
{
    NSString *positionStr = [[NSString alloc] initWithFormat:@"%@,%@", self.labelLatitude.text, self.labelLongitude.text];
    
    NSString *url = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps?11=%@", [positionStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (IBAction)openBackRout
{
    NSString *positionStr = [[NSString alloc] initWithFormat:@"%@,%@", self.labelLatitude.text, self.labelLongitude.text];
    
    NSString *positionDestinyStr = [[NSString alloc] initWithFormat:@"%f,%f", localizacaoDeSaida.coordinate.latitude, localizacaoDeSaida.coordinate.longitude];
    
    
    NSString *url = [[NSString alloc] initWithFormat:@"http://maps.google.com/maps?daddr=%@&saddr=%@", [positionDestinyStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], [positionStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
