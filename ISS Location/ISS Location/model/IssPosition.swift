//
//  IssPosition.swift
//
//  Created by Szymon Szysz on 13/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation


public final class IssPosition: Decodable {

  
  private struct SerializationKeys {
    static let longitude = "longitude"
    static let latitude = "latitude"
  }

  public var longitude: String?
  public var latitude: String?

}
