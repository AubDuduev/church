//
//  ActionsBibleViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension BibleViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func bibleTestamentButton(control: UISegmentedControl){
    self.controllers.logic.changeBibleTestament(control: control)
  }
}
