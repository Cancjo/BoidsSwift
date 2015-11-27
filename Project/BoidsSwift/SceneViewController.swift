//
//  SceneViewController.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit
import SpriteKit

class SceneViewController: UIViewController {
   
   var scene: Scene!
   var settings: Settings! {
      didSet {
         self.scene.settings = self.settings
      }
   }
   
   @IBOutlet var skView: SKView!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let centerPoint = CGPointMake(512.0, 384.0) // center point for landscape orientation
      let scene: Scene = Scene(size:self.skView.bounds.size);
      scene.currentPoint =  centerPoint
      self.scene = scene;
      
      self.skView.showsFPS = true
      self.skView.showsDrawCount = true
      self.skView.showsNodeCount = true
      self.skView.ignoresSiblingOrder = true
      self.skView.presentScene(scene);
   }

   @IBAction func panGestureAction(sender: UIPanGestureRecognizer) {
      //
      // Update target point
      //
      let point = self.scene.convertPointFromView(sender.locationInView(self.skView))
      self.scene.currentPoint = point
   }
   
}
