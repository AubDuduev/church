//
//  ActionsChatViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 24.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ChatViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func sendMessageButton(button: UIButton){
    self.controllers.logic.sendMessage()
  }
  @IBAction func sendMessagePhotoButton(button: UIButton){
    self.controllers.logic.sendPhoto()
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    self.sendMessageTextView.resignFirstResponder()
  }
  @IBAction func tapTableGesture(button: UITapGestureRecognizer){
    self.sendMessageTextView.resignFirstResponder()
  }
}
