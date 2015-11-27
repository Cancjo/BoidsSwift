//
//  RootViewController.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

class RootViewController: UISplitViewController {
   
   var tuneViewController: TuneViewController!
   var sceneViewController: SceneViewController!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      //
      // Setup master and details view controllers with single Settings instance
      //
      let settings = Settings()
      self.tuneViewController = self.viewControllers.findObject(TuneViewController) as! TuneViewController
      self.tuneViewController.settings = settings
      self.sceneViewController = self.viewControllers.findObject(SceneViewController) as! SceneViewController
      self.sceneViewController.settings = settings
   }
}
