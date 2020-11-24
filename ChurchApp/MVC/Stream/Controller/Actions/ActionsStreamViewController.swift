//
//  ActionsStreamViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension StreamViewController {
  
  @IBAction func backButton(button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func playPauseButton(button: UIButton){
    self.controllers.logic.playPauseButton()
    videoPlayerYoutibe.play()
  }
  @IBAction func videoSliderButton(slider: UISlider) {
    self.controllers.present.changeValueSlider(slider: slider)
  }
}
