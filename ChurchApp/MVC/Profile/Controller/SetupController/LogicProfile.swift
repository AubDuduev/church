//
//  LogicProfile.swift
//  ChurchApp
import SwiftEntryKit
import Foundation
import FlagPhoneNumber

class LogicProfile: Controller {
  
  //MARK: - Public variable
  public var VC: ProfileViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
   public func changePhoto(){
     AlertEK.options(title: .addPhoto, message: .addPhotoChange, options: .AddPhoto) { (index) in
       switch index {
         case 0:
           self.VC.photoLibrary.library()
         case 1:
           self.VC.photoLibrary.camera()
         default:
           AlertEK.hide()
       }
     }
   }
  public func saveAvataUserInServer(){
    //1 - Получаем картинку из библиотеки
    if let image = self.VC.userAvatarImageView.image {
      guard let data = image.jpegData(compressionQuality: 0.1) else { return }
      //2 - Сохранаем картинку на сервер и получаем ее УРЛ
      self.VC.controllers.server.postPhotoURL(image: data) { [unowned self] (decPhotoUser) in
        //3 - Обновляем данные пользователя на сервере и локально
        GVuserData.avatarURL = decPhotoUser.file
        self.saveUserDataServer()
      }
    }
  }
  public func saveUserDataServer(){
    let userData = ENCUserData(lastName : "Имя",
                               firstName: self.VC.userNameTextField.text,
                               phone    : self.VC.userNumberTextField.getFormattedPhoneNumber(format: .E164),
                               avatar   : GVuserData.avatarURL)
    self.VC.controllers.server.patchUserData(userData: userData) { [unowned self] (userData) in
      //Сохроняем данные локально
      GVuserData.name      = userData.firstName
      GVuserData.number    = userData.phone
      GVuserData.avatarURL = userData.avatar
      PersistentService.saveContext()
      //Отображаем на контроллере
      self.VC.controllers.present.userData(userData: userData)
      AlertEK.dеfault(title: .information, message: .userDataUpdateSucces)
      self.VC.userNameTextField.resignFirstResponder()
      self.VC.userNumberTextField.resignFirstResponder()
    }
  }
  public func resignFirstResponder(){
    self.VC.userNameTextField.resignFirstResponder()
    self.VC.userNumberTextField.resignFirstResponder()
    self.VC.userIDTextField.resignFirstResponder()
  }
}
//MARK: - Private functions
extension LogicProfile {
  
  private func commonLogic(){
    //1 - Получаем данные пользователя
    self.VC.controllers.server.getUserData { (userData) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerUserData.check(userData: userData) else { return }
      //3 - Презентуем данные
      self.VC.controllers.present.userData(userData: userData!)
    }
  }
}
//MARK: - Initial
extension LogicProfile{
  
  //MARK: - Inition
  convenience init(viewController: ProfileViewController) {
    self.init()
    self.VC = viewController
  }
}

