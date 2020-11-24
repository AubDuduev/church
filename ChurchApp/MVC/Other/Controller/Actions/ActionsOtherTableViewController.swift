//
//  ActionsOtherTableViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension OtherTableViewController {
  
  @IBAction func profileButton(button: UIButton){
    self.controllers.router.push(.Profile)
  }
  @IBAction func ordersButton(button: UIButton){
    self.controllers.router.push(.Orders)
  }
  @IBAction func abautButton(button: UIButton){
    self.controllers.router.push(.Abaut)
  }
  @IBAction func startButton(button: UIButton){
    self.controllers.router.push(.Start)
  }
  @IBAction func contactsButton(button: UIButton){
    self.controllers.router.push(.Contacts)
  }
  @IBAction func shareButton(button: UIButton){
    self.controllers.logic.shareVC()
  }
  @IBAction func bibleButton(button: UIButton){
    self.controllers.router.push(.Bible)
  }
  @IBAction func prayersVCButton(button: UIButton){
    self.controllers.router.push(.Prayers)
  }
}
