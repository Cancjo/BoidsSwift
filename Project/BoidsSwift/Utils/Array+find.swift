//
//  Array+find.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import Foundation

extension Array {
   func findObject(ofClass: AnyClass) -> AnyObject? {
      var result: AnyObject? = nil
      for unit in self {
         if let object = unit as? NSObject {
            if object.isKindOfClass(ofClass) {
               result = object
            }
         }
      }
      return result
   }
}
