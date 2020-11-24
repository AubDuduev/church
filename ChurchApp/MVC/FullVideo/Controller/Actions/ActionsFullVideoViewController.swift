//
//  ActionsFullVideoViewController.swift
//  DgBetTrip
//
//  Created by Developer on 28.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

extension FullVideoViewController {
  
  @IBAction func backButton(_ button: UIButton){
    self.dismiss(animated: true)
  }
  @IBAction func playPauseButton(_ button: UIButton){
     self.controllers.logic.playPauseVideo()
  }
  @IBAction func playPauseGesture(_ gesture: UITapGestureRecognizer){
    self.controllers.logic.playPauseVideo()
  }
  @IBAction func swipeBackGesture(_ gesture: UITapGestureRecognizer){
    self.dismiss(animated: true)
  }
}
