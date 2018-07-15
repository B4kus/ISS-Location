//
//  DateConvert.swift
//  ISS Location
//
//  Created by Szymon Szysz on 15.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import Foundation

func timeConvert(timestamp:Int) -> String {
    
    let unixTimestamp = timestamp
    let dateNew = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "CEST")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    let strDate = dateFormatter.string(from: dateNew)
    
    return strDate
    
}
