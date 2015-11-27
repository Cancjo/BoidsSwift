//
//  Value.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import SpriteKit

struct Value {
   var value: Int
   var range: Range<Int>
   
   init(value: Int, min: Int, max: Int) {
      self.value = value;
      self.range = Range<Int>(start: min, end: max)
   }
}
