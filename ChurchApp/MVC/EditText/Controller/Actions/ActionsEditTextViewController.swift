//
//  ActionsEditTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension EditTextViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  
  @IBAction func brightnessSlider(slider: UISlider){
    self.controllers.logic.brightness(value: slider.value)
  }
  @IBAction func fontSizeSlider(slider: UISlider){
    self.controllers.logic.sizeTExt(value: slider.value)
  }
  @IBAction func setColorButton(button: UIButton){
    self.controllers.logic.colorText(button: button)
  }
  @IBAction func fontType(button: UIButton){
    self.controllers.logic.fontType(tag: button.tag)
  }
}
