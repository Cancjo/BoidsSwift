//
//  Settings.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

class Settings: NSObject {
   
   var velocityRestriction: Value
   var flockSize: Value
   var destinationDistance: Value
   var neighborDistance: Value
   var stiffness: Value

   override init() {
      //
      // Setup default values
      //
      self.velocityRestriction = Value(value: 15, min: 5, max: 75)
      self.flockSize = Value(value: 30, min: 5, max: 100)
      self.destinationDistance = Value(value: 60, min: 5, max: 360)
      self.neighborDistance = Value(value: 30, min: 5, max: 100)
      self.stiffness = Value(value: 10, min: 1, max: 100)
      super.init()
   }
   
}
