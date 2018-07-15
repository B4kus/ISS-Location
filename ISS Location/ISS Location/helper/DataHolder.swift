//
//  DataHolder.swift
//  ISS Location
//
//  Created by Szymon Szysz on 15.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import Foundation


class DataHolder {
    
    static let sharedInstance = DataHolder()
    let url = URLService.self
    var astronauts = ISSAstronauts()
    var locationISS = ISSLocation()

    func parseLocationJSON(complitionBlock: @escaping (Bool) -> Void ) {
        
        guard let vaildURL = URL(string: url.Location.url()) else { return }
        
        downloadJSONFile(url: vaildURL) { (success, data) in
            if success {
                do {
                    let locationJSON = try JSONDecoder().decode(ISSLocation.self, from: data)
                    self.locationISS = locationJSON
                    complitionBlock(true)
                    
                } catch {
                    
                    print("Parse loaction json error")
                    
                }
            }
        }
    }
    
    func paraseAstronatusJSON(complitionBlock: @escaping (Bool) -> Void ) {
        
        guard let vaildURL = URL(string: url.Astronauts.url()) else { return }
        
        downloadJSONFile(url: vaildURL) { (success, data) in
            
            if success {
                
                do {
                    let astronatusJSON = try JSONDecoder().decode(ISSAstronauts.self, from: data)
                    self.astronauts = astronatusJSON
                    complitionBlock(true)
                    
                } catch {
                    
                    print("Parse astronauts json error")
                    
                }
            }
        }
    }
}
