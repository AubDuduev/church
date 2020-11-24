//
//  ServerPrayerText.swift
//  ChurchApp

import Foundation

class ServerPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  
}
//MARK: - Initial
extension ServerPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

