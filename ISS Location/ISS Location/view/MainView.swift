//
//  MainView.swift
//  ISS Location
//
//  Created by Szymon Szysz on 13.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import UIKit
import Mapbox



class MainView: UIView {
    
    let mapView: MGLMapView = {
        
        let map = MGLMapView()
        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
        map.styleURL = url
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return map
    }()
    
    let timestampLabel: UILabel = {
        
        let label = UILabel()
        return label
        
        
    }()
    
    func setUpView(view: UIView) {
        
        view.addSubview(mapView)
        view.addSubview(timestampLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mapView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: timestampLabel)
        view.addConstraintsWithFormat(format: "V:|[v0][v1(30)]|", views: mapView, timestampLabel)
        
    }
    
}
