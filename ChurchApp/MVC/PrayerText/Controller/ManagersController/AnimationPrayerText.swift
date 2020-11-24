//
//  AnimationPrayerText.swift
//  ChurchApp

import Foundation

class AnimationPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  
}
//MARK: - Initial
extension AnimationPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

