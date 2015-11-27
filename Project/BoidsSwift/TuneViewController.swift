//
//  TuneViewController.swift
//  BoidsSwift
//
//  Created by Gavrilko Alexander on 11/23/15.
//  Copyright © 2015 Gavrilko Alexander. All rights reserved.
//

import UIKit

class TuneViewController: UIViewController {

   var settings: Settings! {
      didSet {
         //
         // Setup UI with given settings
         //
         self.velocityRestrictionSlider.setup(self.settings.velocityRestriction)
         self.flockSizeSlider.setup(self.settings.flockSize)
         self.destinationDistanceSlider.setup(self.settings.destinationDistance)
         self.neighborDistanceSlider.setup(self.settings.neighborDistance)
         self.stiffnessSlider.setup(self.settings.stiffness)
         self.updateVelocityRestrictionLabel()
         self.updateFlockSizeLabel()
         self.updateDestinationDistanceLabel()
         self.updateNeighborDistanceLabel()
         self.updateStiffnessLabel()
      }
   }
   
   @IBOutlet weak var velocityRestrictionLabel: UILabel!
   @IBOutlet weak var velocityRestrictionSlider: UISlider!
   @IBOutlet weak var flockSizeLabel: UILabel!
   @IBOutlet weak var flockSizeSlider: UISlider!
   @IBOutlet weak var destinationDistanceLabel: UILabel!
   @IBOutlet weak var destinationDistanceSlider: UISlider!
   @IBOutlet weak var neighborDistanceLabel: UILabel!
   @IBOutlet weak var neighborDistanceSlider: UISlider!
   @IBOutlet weak var stiffnessLabel: UILabel!
   @IBOutlet weak var stiffnessSlider: UISlider!
   
   @IBAction func velocityRestrictionAction(sender: UISlider) {
      self.settings.velocityRestriction.value = Int(sender.value)
      self.updateVelocityRestrictionLabel()
   }
   
   @IBAction func stiffnessAction(sender: UISlider) {
      self.settings.stiffness.value = Int(sender.value)
      self.updateStiffnessLabel()
   }
   
   @IBAction func flockSizeAction(sender: UISlider) {
      self.settings.flockSize.value = Int(sender.value)
      self.updateFlockSizeLabel()
   }
   
   @IBAction func destinationDistanceAction(sender: UISlider) {
      self.settings.destinationDistance.value = Int(sender.value)
      self.updateDestinationDistanceLabel()
   }
   
   @IBAction func neighborDistanceAction(sender: UISlider) {
      self.settings.neighborDistance.value = Int(sender.value)
      self.updateNeighborDistanceLabel()
   }
   
   func updateVelocityRestrictionLabel() {
      self.velocityRestrictionLabel.text = "Velocity restriction: \(self.settings.velocityRestriction.value)"
   }
   
   func updateFlockSizeLabel() {
      self.flockSizeLabel.text = "Flock size: \(self.settings.flockSize.value)"
   }
   
   func updateDestinationDistanceLabel() {
      self.destinationDistanceLabel.text = "Distance to point: \(self.settings.destinationDistance.value)"
   }
   
   func updateNeighborDistanceLabel() {
      self.neighborDistanceLabel.text = "Distance to neighbor: \(self.settings.neighborDistance.value)"
   }
   
   func updateStiffnessLabel() {
      self.stiffnessLabel.text = "Stiffness: \(self.settings.stiffness.value)"
   }
}
