//
//  Bird.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import SpriteKit

class Bird: SKNode {
   
   private var sprite: SKSpriteNode
   var velocity: CGPoint
   
   override init() {
      
      let atlas = SKTextureAtlas(named: "Scene");
      let sprite = SKSpriteNode(texture: atlas.textureNamed("violet"));
      
      let velocity = CGPointZero
      
      self.sprite = sprite
      self.velocity = velocity
      
      super.init()
      
      self.addChild(sprite)
   }

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

}
