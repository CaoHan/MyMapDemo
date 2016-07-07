//
//  CustomAnnotationView.h
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomAnnotationView : MKAnnotationView
+ (instancetype)annotationViewWithMapView:(MKMapView *)mapView;
@end


