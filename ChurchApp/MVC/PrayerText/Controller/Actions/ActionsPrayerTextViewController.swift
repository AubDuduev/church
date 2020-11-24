//
//  ActionsPrayerTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension PrayerTextViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
 
  @IBAction func editTextButton(button: UIButton){
    self.controllers.router.push(.EditText)
  }
  @IBAction func shareButton(button: UIButton){
    self.controllers.logic.share()
  }
}
