//
//  ActionsNoteViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension NoteViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func newOrderButton(button: UIButton){
    self.controllers.logic.newOrder()
  }
  @IBAction func addNameButton(button: UIButton){
    self.controllers.logic.addName()
  }
  @IBAction func touchesScrillViewBegan(gesture: UITapGestureRecognizer){
    // self.poeipleTextFields.forEach{$0.resignFirstResponder()}
  }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    //self.poeipleTextFields.forEach{$0.resignFirstResponder()}
  }
}
