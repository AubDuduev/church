//
//  ImagePickerProfileDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[.editedImage] as? UIImage {
      self.userAvatarImageView.image = image
    } else if let image = info[.originalImage] as? UIImage {
      self.userAvatarImageView.image = image
    }
    self.controllers.logic.saveAvataUserInServer()
    picker.dismiss(animated: true)
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true) {
     
    }
  }
}
