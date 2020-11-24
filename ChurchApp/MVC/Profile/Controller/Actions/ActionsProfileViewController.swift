//
//  ActionsProfileViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ProfileViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func addPhotoButton(button: UIButton){
    self.controllers.logic.changePhoto()
  }
  @IBAction func saveUserDataButton(button: UIButton){
    self.controllers.logic.saveUserDataServer()
  }
  @IBAction func scrollGesure(gesture: UITapGestureRecognizer){
     self.controllers.logic.resignFirstResponder()
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.controllers.logic.resignFirstResponder()
  }
}
