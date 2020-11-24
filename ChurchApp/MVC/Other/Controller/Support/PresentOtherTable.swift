//
//  PresentOtherTable.swift
//  ChurchApp

import Foundation

class PresentOtherTable: Controller {
  
  //MARK: - Public variable
  public var VC: OtherTableViewController!
  
  
  public func viewDidAppear() {
    self.setUserData()
  }
  
  public func setUserData(){
    let URL = self.VC.server.urls.get(type: .store(GVuserData.avatarURL ?? "")).URL
    self.VC.avatarImageView.sd_setImage(with: URL) { [weak self] (_, error, _, _) in
      guard let self = self else { return }
      if let error = error {
        self.VC.avatarImageView.image = #imageLiteral(resourceName: "userChurcheApp")
        print("Error set avatar user nav bar , Class: NavTabBar", "Localized: \(error.localizedDescription)")
      }
    }
  }
}
//MARK: - Initial
extension PresentOtherTable{
  
  //MARK: - Inition
  convenience init(viewController: OtherTableViewController) {
    self.init()
    self.VC = viewController
  }
}

