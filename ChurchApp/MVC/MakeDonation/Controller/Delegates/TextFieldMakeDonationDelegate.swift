//
//  TextFieldMakeDonationDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 21.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension MakeDonationViewController: UITextFieldDelegate {
  
  func textFieldDidEndEditing(_ textField: UITextField) {
   
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.nameTextField.resignFirstResponder()
    self.summTextField.resignFirstResponder()
    return true
  }
}
