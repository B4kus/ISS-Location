//
//  ISSLocation.swift
//
//  Created by Szymon Szysz on 13/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation


public final class ISSLocation: Decodable {

  private struct SerializationKeys {
    static let iss_position = "iss_position"
    static let timestamp = "timestamp"
    static let message = "message"
  }

  public var iss_position: IssPosition?
  public var timestamp: Int?
  public var message: String?



}
