//
//  AnimationStream.swift
//  ChurchApp

import UIKit

class AnimationStream: Controller {
  
  //MARK: - Public variable
  public var VC: StreamViewController!
  
  public func playButton(){
    if self.VC.videoView.controll.isPlay {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.VC.playPauseButton.alpha = 0
        self.VC.playPauseButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      }){ (finishAnimation) in
        self.VC.playPauseButton.transform = .identity
      }
    } else {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        self.VC.playPauseButton.alpha = 1
        self.VC.playPauseButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      })
    }
  }
}
//MARK: - Initial
extension AnimationStream{
  
  //MARK: - Inition
  convenience init(viewController: StreamViewController) {
    self.init()
    self.VC = viewController
  }
}

