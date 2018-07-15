//
//  CheckIConnection.swift
//  ISS Location
//
//  Created by Szymon Szysz on 15.07.2018.
//  Copyright © 2018 Szymon Szysz. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
