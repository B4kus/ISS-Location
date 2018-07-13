//
//  ISSAstronauts.swift
//
//  Created by Szymon Szysz on 13/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation


public final class ISSAstronauts: Decodable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let people = "people"
    static let number = "number"
    static let message = "message"
  }

  // MARK: Properties
  public var people: [People]?
  public var number: Int?
  public var message: String?




}
