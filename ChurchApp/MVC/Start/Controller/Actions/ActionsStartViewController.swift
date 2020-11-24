//
//  ActionsStartViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension StartViewController {
  
  @IBAction func pageButton(button: UIButton){
    self.controllers.logic.page(tag: button.tag)
  }
  @IBAction func pageRightGesture(gesture: UISwipeGestureRecognizer){
    self.controllers.logic.page(tag: 1)
  }
  @IBAction func pageLeftGesture(gesture: UISwipeGestureRecognizer){
    self.controllers.logic.page(tag: 0)
  }
}
