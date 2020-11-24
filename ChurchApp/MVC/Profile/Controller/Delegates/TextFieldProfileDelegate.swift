//
//  TextFieldProfileDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ProfileViewController: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.controllers.logic.resignFirstResponder()
    return true
  }
}
