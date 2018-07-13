//
//  ISSLocation.swift
//
//  Created by Szymon Szysz on 13/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation


public final class ISSLocation: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let issPosition = "iss_position"
    static let timestamp = "timestamp"
    static let message = "message"
  }

  // MARK: Properties
  public var issPosition: IssPosition?
  public var timestamp: Int?
  public var message: String?



}
