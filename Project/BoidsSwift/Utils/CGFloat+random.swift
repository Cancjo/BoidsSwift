//
//  CGFloat+random.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

extension CGFloat {
   static func random(max: CGFloat) -> CGFloat {
      let result = CGFloat(arc4random_uniform(UInt32(max)))
      return result
   }
}
