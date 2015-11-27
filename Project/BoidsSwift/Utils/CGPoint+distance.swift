//
//  CGPoint+distance.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

extension CGPoint {
   func distance(toPoint: CGPoint) -> CGFloat {
      let dx = self.x - toPoint.x
      let dy = self.y - toPoint.y
      let result = sqrt(dx * dx + dy * dy)
      return result
   }
}