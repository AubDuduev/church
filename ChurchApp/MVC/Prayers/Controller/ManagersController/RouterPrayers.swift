//
//  RouterPrayers.swift
//  ChurchApp
import Foundation

class RouterPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  
  public func push(_ type: Push){
    
    switch type {
      case .PrayerTextVC( let prayerText):
        self.pushPrayerTextVC(prayerText: prayerText)
    }
  }
  
  enum Push {
    case PrayerTextVC(GDPrayerText)
  }
}
//MARK: - Private functions
extension RouterPrayers {
  
  private func pushPrayerTextVC(prayerText: GDPrayerText){
    let prayerTextVC = self.VC.getVCForID(storyboardID     : .PrayerText,
                                          vcID             : .PrayerTextVC,
                                          transitionStyle  : .crossDissolve,
                                          presentationStyle: .fullScreen) as! PrayerTextViewController
    prayerTextVC.prayerText = prayerText
    self.VC.present(prayerTextVC, animated: true)
  }
}
//MARK: - Initial
extension RouterPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

