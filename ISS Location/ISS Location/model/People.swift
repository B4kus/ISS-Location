//
//  People.swift
//
//  Created by Szymon Szysz on 13/07/2018
//  Copyright (c) . All rights reserved.
//

import Foundation


public final class People: Decodable {


  private struct SerializationKeys {
    static let name = "name"
    static let craft = "craft"
  }


  public var name: String?
  public var craft: String?

}
