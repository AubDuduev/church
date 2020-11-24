//
//  AnimationWorship.swift
//  ChurchApp

import UIKit

class AnimationWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  
}
//Анимация ячеики стрима
extension AnimationWorship {
  
  public func hiddenAnimationPlayButton(cell: StreamCollectionCell){
    if cell.videoStreamView.controll.isPlay {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        cell.playButtonLabel.alpha = 0
        cell.playButtonLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      }){ (finishAnimation) in
        cell.playButtonLabel.transform = .identity
      }
    } else {
      UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        cell.playButtonLabel.alpha = 1
        cell.playButtonLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
      })
    }
  }
}
//MARK: - Initial
extension AnimationWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

