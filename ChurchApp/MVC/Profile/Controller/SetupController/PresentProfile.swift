//
//  PresentProfile.swift
//  ChurchApp
import SDWebImage
import Foundation
import FlagPhoneNumber

class PresentProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  public func userData(userData: CODUserData){
    self.VC.userNameTextField.text = userData.firstName
    self.VC.userNumberTextField.set(phoneNumber: userData.phone ?? "") 
    self.VC.userIDTextField.text = String(userData.ID ?? 0)
    let url = self.VC.server.urls.get(type: .store(GVuserData.avatarURL)).URL
    self.VC.userAvatarImageView.isSkeletonable = true
    self.VC.userAvatarImageView.showAnimatedGradientSkeleton()
    self.VC.userAvatarImageView.sd_setImage(with: url) { [weak self] (_, error, _, _) in
      self?.VC.userAvatarImageView.hideSkeleton()
      if let error = error {
        self?.VC.userAvatarImageView.image = #imageLiteral(resourceName: "userChurcheApp")
        print("Error set avatar user prifile , Class: PresentProfile", "Localized: \(error.localizedDescription)")
        return
      }
    }
  }
}
//MARK: - Initial
extension PresentProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

