//
//  ViewController.swift
//  ISS Location
//
//  Created by Szymon Szysz on 13.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import Mapbox
import Alamofire
class ViewController: UIViewController, MGLMapViewDelegate {
    
    let mainView = MainView()
    let loginTime = Date()
    var peopleArray = [String]()
    let timer : DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.setUpView(view: view)
        mainView.mapView.delegate = self
        checkInternetStatus()
        refreshData()

    }
    
    func refreshData() {
        
        timer.schedule(deadline: .now(), repeating: .seconds(10))
        timer.setEventHandler
            {
            
                self.checkInternetStatus()
        }
        timer.resume()
        
    }

    func checkInternetStatus() {
        let group = DispatchGroup()
        
        if Connectivity.isConnectedToInternet() {
            
            group.enter()
            DataHolder.sharedInstance.parseLocationJSON { (success) in
                if success {
                    group.leave()
                }
            }
            group.enter()
            DataHolder.sharedInstance.paraseAstronatusJSON { (success) in
                if success {
                    group.leave()
                    
                }
            }
            group.notify(queue: .main) {
                
                self.saveDataToUserDefaults()
                self.astronautsArray()
                self.setUpWithData()
                
            }
            
        } else {
            
            loadLastTimeStamp()
            loadLastPositionOfISS()
        }
    }
    
    func loadLastPositionOfISS () {
        
        if let latitude = UserDefaults.standard.object(forKey: "lastPositionLatitude") as? String, let longitude = UserDefaults.standard.object(forKey:"lastPositionLongitude") as? String, let validLatitude = CLLocationDegrees(latitude), let validLongitude = CLLocationDegrees(longitude) {
            
            
            let center = CLLocationCoordinate2D(latitude: validLatitude, longitude: validLongitude)
            self.mainView.mapView.setCenter(center, zoomLevel: 7, direction: 0, animated: false)
            self.addAnotation(latitude: validLatitude, longitude: validLongitude)
            
        }
    }
    
    func loadLastTimeStamp() {
        
        if let validDate = UserDefaults.standard.object(forKey: "timestamp") as? String {
            
            mainView.timestampLabel.text = "Last API Call was: \(validDate)"
            
        }
    }
    
    func saveDataToUserDefaults() {
        
        UserDefaults.standard.set(DataHolder.sharedInstance.locationISS.iss_position?.latitude, forKey: "lastPositionLatitude")
        UserDefaults.standard.set(DataHolder.sharedInstance.locationISS.iss_position?.longitude, forKey: "lastPositionLongitude")
        guard let validTime = DataHolder.sharedInstance.locationISS.timestamp else { return }
        let convertedData = timeConvert(timestamp: validTime)
        UserDefaults.standard.set(convertedData, forKey: "timestamp")
        
    }
    
    func addAnotation(latitude: CLLocationDegrees,longitude: CLLocationDegrees ) {
        
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "International Space Station"
        annotation.subtitle = "\(peopleArray)"
        mainView.mapView.addAnnotation(annotation)
        
    }
    
    func astronautsArray() {
        
        guard let validArray = DataHolder.sharedInstance.astronauts.people else { return }
        
        for person in validArray {
            guard let validPerson = person.name else { return }
            peopleArray.append(validPerson)
        }
    }
    
    func setUpWithData() {
        
        if let validDate = DataHolder.sharedInstance.locationISS.timestamp, let validLatitude = DataHolder.sharedInstance.locationISS.iss_position?.latitude ,let validLongitude = DataHolder.sharedInstance.locationISS.iss_position?.longitude,
            let test  = CLLocationDegrees(validLongitude), let testtwo = CLLocationDegrees(validLatitude) {
            
            let convertedData = timeConvert(timestamp: validDate)
            mainView.timestampLabel.text = "Last API Call was: \(convertedData)"
            mainView.mapView.setCenter(CLLocationCoordinate2D(latitude: testtwo, longitude: test), zoomLevel: 3, animated: true)
            addAnotation(latitude: testtwo, longitude: test)
        }
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        
        return true
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        
        let camera  = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: 4500, pitch: 50, heading: 200)
        mapView.setCamera(camera, withDuration: 5, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
        
    }
}


