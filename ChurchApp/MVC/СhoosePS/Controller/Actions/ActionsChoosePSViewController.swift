//
//  ActionsChoosePSViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 30.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ChoosePSViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func doneButton(button: UIButton){
    self.controllers.logic.createData()
  }
}
