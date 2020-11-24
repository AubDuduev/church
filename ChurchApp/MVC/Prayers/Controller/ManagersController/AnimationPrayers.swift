//
//  AnimationPrayers.swift
//  ChurchApp

import Foundation

class AnimationPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  
}
//MARK: - Initial
extension AnimationPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

