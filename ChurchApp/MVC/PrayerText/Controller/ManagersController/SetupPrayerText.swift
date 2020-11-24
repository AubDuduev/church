//
//  SetupPrayerText.swift
//  ChurchApp

import Foundation

class SetupPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  
}
//MARK: - Initial
extension SetupPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

