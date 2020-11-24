//
//  PresentPrayerText.swift
//  ChurchApp

import Foundation

class PresentPrayerText: Controller {
  
  //MARK: - Public variable
  public var VC: PrayerTextViewController!
  
  public func viewDidLoad() {
    self.contentTextView()
    self.navBarTitleLabel()
  }
  
  public func navBarTitleLabel(){
    self.VC.navBarTitleLabel.text = self.VC.prayerText.title
  }
  public func contentTextView(){
    self.VC.contentTextView.text = self.VC.prayerText.text.htmlToString
  }
}
//MARK: - Initial
extension PresentPrayerText{
  
  //MARK: - Inition
  convenience init(viewController: PrayerTextViewController) {
    self.init()
    self.VC = viewController
  }
}

