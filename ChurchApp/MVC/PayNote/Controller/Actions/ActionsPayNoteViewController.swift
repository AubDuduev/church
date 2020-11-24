//
//  ActionsPayNoteViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 16.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension PayNoteViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func daysDonationButtons(button: UIButton){
    self.controllers.logic.daysDonationButtons(button: button)
  }
  @IBAction func recurrentDonationButton(button: UIButton){
    self.controllers.logic.recurrentDonation(button: button)
  }
  @IBAction func newOrderButton(button: UIButton){
    self.controllers.logic.newOrder()
  }
  @IBAction func сhoosePSButton(button: UIButton){
    self.controllers.logic.pushChoosePS(button: button)
  }
  @IBAction func aboutHealthAboutReposeButton(button: UIButton){
    self.controllers.logic.aboutHealthAboutRepose(button: button)
  }
}
