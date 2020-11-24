//
//  ActionsMakeDonationViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension MakeDonationViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func daysDonationButtons(button: UIButton){
    self.controllers.logic.daysDonationButtons(button: button)
  }
  @IBAction func infoDonationButton(button: UIButton){
    self.controllers.router.push(.PopOver)
  }
  @IBAction func recurrentDonationButton(button: UIButton){
    self.controllers.logic.recurrentDonation(button: button)
  }
  @IBAction func newOrderButton(button: UIButton){
    self.controllers.logic.newOrder()
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.nameTextField.resignFirstResponder()
    self.summTextField.resignFirstResponder()
  }
}
