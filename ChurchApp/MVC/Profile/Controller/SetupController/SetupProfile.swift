//
//  SetupProfile.swift
//  ChurchApp
import NVActivityIndicatorView
import UIKit

class SetupProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  public func viewDidLoad() {
    self.userNameView()
    self.userNumberView()
    self.saveButton()
    self.photoLibrary()
    self.loading()
    self.imagePickerCcntroller()
    self.userAvatarImageView()
    self.delegates()
  }
}
//MARK: - Private functions
extension SetupProfile{
  
  private func delegates(){
    self.VC.userNameTextField.delegate = self.VC
    self.VC.userNumberTextField.delegate = self.VC
    self.VC.userIDTextField.delegate = self.VC
    self.VC.userNumberTextField.setFlag(countryCode: .RU)
  }
  private func userAvatarImageView(){
    let corner = self.VC.userAvatarImageView.bounds.width / 2
    self.VC.userAvatarImageView.cornerRadius(corner, true)
  }
  private func userNameView(){
    self.VC.userNameView.cornerRadius(7, true)
  }
  private func photoLibrary(){
    self.VC.photoLibrary = PhotoLibrary(viewController: self.VC)
    self.VC.photoLibrary.setup()
  }
  private func userNumberView(){
    self.VC.userNumberView.cornerRadius(7, true)
  }
  private func saveButton(){
    self.VC.saveButton.cornerRadius(7, true)
  }
  private func loading(){
    let rect = CGRect(x: 100, y: 100, width: 150, height: 150)
    self.VC.loadingUploadPhoto = NVActivityIndicatorView(frame: rect, type: .lineScalePulseOut, color: .set(.projectYellow), padding: 10)
    self.VC.loadingUploadPhoto.center = self.VC.view.center
    self.VC.view.addSubview(self.VC.loadingUploadPhoto)
  }
  private func imagePickerCcntroller(){
    self.VC.imagePikerController.allowsEditing = true
    self.VC.imagePikerController.delegate      = self.VC
  }
}
//MARK: - Initial
extension SetupProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

