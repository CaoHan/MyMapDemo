//
//  ViewController.m
//  mapDemo
//
//  Created by 曹晗 on 16/7/7.
//  Copyright © 2016年 CaoHan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    userDef = [NSUserDefaults standardUserDefaults];
    self.mapView.delegate = self;
    [self initView];
    
}

- (void)initView {
    //初始化界面
    _mapView.showsUserLocation = YES;
    
    //定位自己
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    if([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];  //获取自己位置
    [self getOtherLocationNoSleep]; //获取另一个人位置
    
    //创建持续获取 自己 位置的线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(getSelfLocation) object:nil];
    [thread start];
    
    //创建持续获取 别人 位置的线程
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(getOtherLocation) object:nil];
    [thread2 start];
}

//持续获取自己的定位 30s一次
- (void)getSelfLocation {
    while (true) {
        [NSThread sleepForTimeInterval:30];
        [locationManager startUpdatingLocation];
    }
}
//获取别人的定位 30s一次
- (void)getOtherLocation {
    [NSThread sleepForTimeInterval:30];
    NSString* otherUser = [userDef valueForKey:@"otherUser"];
    httpHelper *helper = [[httpHelper alloc]init];
    [helper getLocationInfo:otherUser success:^(id responseObj){
        
        NSDictionary* resDic = (NSDictionary*)responseObj;
        NSString* latitudeStr = [resDic valueForKey:@"user_latitude"];
        NSString* longitudeStr = [resDic valueForKey:@"user_longitude"];
        
        //创建大头针
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(latitudeStr.doubleValue,longitudeStr.doubleValue);
        
        //        float zoomLevel = 0.02;
        //        MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
        //        [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
        
        [self createAnnotationWithCoords:coords];
    }failure:^(NSError* error){
        NSLog(@"Erroe:%@",error);
    }];
}

- (void)getOtherLocationNoSleep {
    NSString* otherUser = [userDef valueForKey:@"otherUser"];
    httpHelper *helper = [[httpHelper alloc]init];
    [helper getLocationInfo:otherUser success:^(id responseObj){
        
        NSDictionary* resDic = (NSDictionary*)responseObj;
        NSString* latitudeStr = [resDic valueForKey:@"user_latitude"];
        NSString* longitudeStr = [resDic valueForKey:@"user_longitude"];
        
        //创建大头针
        CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(latitudeStr.doubleValue,longitudeStr.doubleValue);
        [self createAnnotationWithCoords:coords];
        
    }failure:^(NSError* error){
        NSLog(@"Erroe:%@",error);
    }];
}

//停止定位并输出
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [locationManager stopUpdatingLocation];
    
    NSString *strLat = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.latitude];
    NSString *strLng = [NSString stringWithFormat:@"%.4f",newLocation.coordinate.longitude];
    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    NSString* selfUser = [userDef valueForKey:@"selfUser"];
    httpHelper *helper = [[httpHelper alloc]init];
    [helper sendLocationInfo:selfUser user_latitude:strLat user_longitude:strLng];
}


//创建大头针方法
-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) coords {
    CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
    annotation.coordinate = coords;
    annotation.title = @"标题";
    annotation.subtitle = @"子标题";
    annotation.icon = @"Icon-iPhone-29";
    [self.mapView addAnnotation:annotation];
}

//自定义大头针模型
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(CustomAnnotation *)annotation
{
    // 如果是系统自带的大头针控件, 不做处理
    // 如果返回nil, 就会按照系统的默认做法
    if ([annotation isKindOfClass:[CustomAnnotation class]] == NO) return nil;
    // 1.创建annoView
    CustomAnnotationView *annoView = [CustomAnnotationView annotationViewWithMapView:mapView];
    // 2.给大头针控件传递模型数据
    annoView.annotation = annotation;
    return annoView;
}

//获取定位权限
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    if (
        ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)] && status != kCLAuthorizationStatusNotDetermined && status != kCLAuthorizationStatusAuthorizedWhenInUse) ||
        (![locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)] && status != kCLAuthorizationStatusNotDetermined && status != kCLAuthorizationStatusAuthorized)
        ) {
        
        NSString *message = @"您的手机目前未开启定位服务，如欲开启定位服务，请至设定开启定位服务功能";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"无法定位" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        
    }else {
        
        [locationManager startUpdatingLocation];
    }
}
//发生错误时输出
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locError:%@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
