//
//  ActionsRegistrationViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension RegistrationViewController {
  
  @IBAction func registrationButton(button: UIButton){
    self.controllers.router.push(.tabBarVC)
  }
  @IBAction func informationButton(button: UIButton){
    self.controllers.logic.infoView()
  }
}
