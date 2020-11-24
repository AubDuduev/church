//
//  ActionsDonationsViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension DonationsViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func descriptionViewPanGestureGesure(gesture: UIPanGestureRecognizer){
    self.controllers.animation.panGesture(gesture: gesture)
  }
  @IBAction func descriptionViewTapGestureGesure(gesture: UITapGestureRecognizer){
    self.controllers.animation.tapGesture(gesture: gesture)
  }
  @IBAction func makeDonationButton(button: UIButton){
    self.controllers.router.push(.pushMakeDonation)
  }
}
