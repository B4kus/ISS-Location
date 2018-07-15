//
//  DownloadHandler.swift
//  ISS Location
//
//  Created by Szymon Szysz on 15.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import Foundation
import Alamofire

enum URLService {
    
    case Location
    case Astronauts
    
    func url() -> String {
        let baseURL = "http://api.open-notify.org"
        switch self {
        case .Location:
            return baseURL + "/iss-now.json"
        case .Astronauts:
            return baseURL + "/astros.json"
        }
    }
}

func downloadJSONFile(url: URL, complitionBlock: @escaping (Bool, Data) -> Void ){
    
    Alamofire.request(url).responseData { (response) in
        switch response.result {
        case .success(let data):
            
            complitionBlock(true, data)
            
        case .failure(_):
            print("Error")
            
        }
    }
}


