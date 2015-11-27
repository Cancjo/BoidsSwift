//
//  Scene.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import Foundation
import SpriteKit

class Scene: SKScene {
   
   private var actualPointIndicator: SKSpriteNode
   private var flock: [Bird]
   
   var settings: Settings!
   
   var actualPoint: CGPoint {
      didSet {
         self.actualPointIndicator.position = self.actualPoint
      }
   }
   
   var currentPoint: CGPoint {
      didSet {
         var actualPoint = self.currentPoint
         if ( actualPoint.x < 0.0 ) {
            actualPoint.x = 0.0
         } else if ( actualPoint.x > size.width ) {
            actualPoint.x = size.width
         }
         if ( actualPoint.y < 0.0 ) {
            actualPoint.y = 0.0
         } else if ( actualPoint.y > size.height ) {
            actualPoint.y = size.height
         }
         self.actualPoint = actualPoint
      }
   }
   
   override init(size: CGSize) {
      
      let atlas = SKTextureAtlas(named: "Scene")
      let actualPointTexture = atlas.textureNamed("target")
      
      let actualPointIndicator = SKSpriteNode(texture: actualPointTexture)
      
      let flock = [Bird]()
      
      self.actualPointIndicator = actualPointIndicator
      self.flock = flock
      self.actualPoint = CGPointZero
      self.currentPoint = CGPointZero
      
      super.init(size: size)
      
      self.scaleMode = SKSceneScaleMode.AspectFit
      self.backgroundColor = SKColor.grayColor()
      self.addChild(actualPointIndicator)
      
   }
   
   required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func update(currentTime: NSTimeInterval) {
      
      //
      // Update number of size accordingly to settings value
      //
      if self.flock.count > self.settings.flockSize.value {
         for i in Int(self.settings.flockSize.value)...self.flock.count-1 {
            let bird: Bird = self.flock[i]
            bird.removeFromParent()
         }
         self.flock.removeRange(Range<Int>(start: self.settings.flockSize.value, end: self.flock.count - 1))
      } else if self.flock.count < self.settings.flockSize.value {
         for _ in self.flock.count...Int(self.settings.flockSize.value-1) {
            let position = CGPointMake(CGFloat.random(self.size.width), CGFloat.random(self.size.height))
            let bird = Bird();
            bird.position = position
            self.flock.append(bird)
            self.addChild(bird)
         }
      }
      
      //
      // Perform Boids calculation
      //
      if self.flock.count > 0 {
         
         // power of felocity gain
         let stiffness = CGFloat(self.settings.stiffness.value) / CGFloat(self.settings.stiffness.range.endIndex)
         
         for unit in self.flock {
            let v1 = self.rule1(unit)
            let v2 = self.rule2(unit)
            let v3 = self.rule3(unit)
            let v4 = self.rule4(unit)
            
            unit.velocity.x += (v1.x + v2.x + v3.x + v4.x) * stiffness
            unit.velocity.y += (v1.y + v2.y + v3.y + v4.y) * stiffness
            
            //
            // Restrict velocity
            //
            let velLen = sqrt(unit.velocity.x * unit.velocity.x + unit.velocity.y * unit.velocity.y)
            if abs(velLen) > CGFloat(self.settings.velocityRestriction.value) {
               unit.velocity.x /= velLen
               unit.velocity.y /= velLen
               unit.velocity.x *= CGFloat(self.settings.velocityRestriction.value)
               unit.velocity.y *= CGFloat(self.settings.velocityRestriction.value)
            }
            
            unit.position.x = unit.position.x + unit.velocity.x
            unit.position.y = unit.position.y + unit.velocity.y
         }
      }
   }
   
   /**
   Boids try to fly towards the centre of mass of neighbouring boids.
   */
   func rule1(bird: Bird) -> CGPoint {
      var result = CGPointZero
      for unit in self.flock {
         if unit != bird {
            result.x += unit.position.x
            result.y += unit.position.y
         }
      }
      
      result.x /= CGFloat(self.flock.count - 1)
      result.y /= CGFloat(self.flock.count - 1)
      
      result.x -= bird.position.x
      result.y -= bird.position.y
      result.x /= 100.0
      result.y /= 100.0
      
      return result
   }
   
   /**
    Boids try to keep a small distance away from other boids
   */
   func rule2(bird: Bird) -> CGPoint {
      var result = CGPointZero
      for unit in self.flock {
         if unit != bird {
            if unit.position.distance(bird.position) < CGFloat(self.settings.neighborDistance.value) {
               result.x -= unit.position.x - bird.position.x
               result.y -= unit.position.y - bird.position.y
            }
         }
      }
      return result
   }
   
   /**
    Boids try to match velocity with near boids
   */
   func rule3(bird: Bird) -> CGPoint {
      var result = CGPointZero
      for unit in self.flock {
         if unit != bird {
            result.x += bird.velocity.x
            result.y += bird.velocity.y
         }
      }
      result.x /= CGFloat(self.flock.count - 1)
      result.y /= CGFloat(self.flock.count - 1)
      
      result.x -= bird.velocity.x
      result.y -= bird.velocity.y
      result.x /= 32.0
      result.y /= 32.0
      
      return result
   }
   
   /**
    Moving to destination point
    */
   func rule4(bird: Bird) -> CGPoint {
      var result = self.actualPoint
      result.x -= bird.position.x
      result.y -= bird.position.y
      result.x /= CGFloat(self.settings.destinationDistance.value)
      result.y /= CGFloat(self.settings.destinationDistance.value)
      return result
   }

}
