//
//  UISlider+Value.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

extension UISlider {
   func setup(value: Value) {
      self.minimumValue = Float(value.range.startIndex)
      self.maximumValue = Float(value.range.endIndex)
      self.value = Float(value.value);
   }
}
