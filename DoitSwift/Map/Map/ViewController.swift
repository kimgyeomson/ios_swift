//
//  ViewController.swift
//  Map
//
//  Created by 김겸손 on 2/26/24.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self // 상수 locationManager의 delegate를 self로 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        locationManager.requestWhenInUseAuthorization() // 위치 데이터를 추적하기 위해 사용자에게 승인을 요청
        locationManager.startUpdatingLocation() // 위치 업데이트 시작
        myMap.showsUserLocation = true // 위치 보기 값을 true로 설정
    }

    func goLoction(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span :Double) {
        // 위도 값과 경도 값을 매개변수로 하여 CLLocation Coordinate2DMake 함수를 호출하고, 리턴 값을 pLcation으로 받습니다.
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        // 범위 값을 매개변수로 하여 CLLocation Coordinate2DMake 함수를 호출하고, 리턴 값을 spanValue로 받습니다
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        // pLocation과 spanValue 값을 매개변수로 하여 MKCoordinateRegionMake 함수를 호출하고, 리턴 값을 pRegion으로 받습니다.
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        // pRegion 값을 매개변수로 하여 myMap.setRegion함수를 호출합니다.
        myMap.setRegion(pRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last // 위치가 업데이트되면 먼저 마지막 위치 값을 찾아냅니다.
        // 마지막 위치의 위도, 경도 값을 가지고 앞에서 만든 goLocation 함수를 호출합니다.
        // 이때 delta 값은 지도의 크기를 정하는데, 값이 작을수록 확대되는 효과가 있습니다. delta를 0.01로 하였으니 1의 값보다 지도를 100배로 확대해서 보여줍니다.
        goLoction(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first // placemarks 값의 첫 부분만 pm 상수로 대입합니다.
            let country = pm!.country // pm 상수에서 나라 값을 country 상수에 대입합니다.
            var address:String = country! // 문자열 address에 country 상수의 값을 대입합니다.
            if pm!.thoroughfare != nil {
                address += " " // pm 상수에서 도로 값이 존재하면 address 문자열에 추가합니다.
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
        })
        
        locationManager.stopUpdatingLocation() // 마지막으로 위치가 업데이트되는 것을 멈추게 합니다
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
    }
    
}

