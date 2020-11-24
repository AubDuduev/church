//
//  PhotoLibrary.swift
//  Leap
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import Photos
import UIKit

class PhotoLibrary {
  
  private var addPhotoImagePicker: UIImagePickerController!
  public let viewController      : UIViewController!
  
  public func setup(){
    self.addPhotoImagePicker            = UIImagePickerController()
    self.addPhotoImagePicker.delegate   = self.viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
    self.addPhotoImagePicker.isEditing  = true
    self.addPhotoImagePicker.modalPresentationStyle = .fullScreen
    self.addPhotoImagePicker.modalTransitionStyle   = .crossDissolve
  }
  
  public func library(){
    if !UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
      PHPhotoLibrary.requestAuthorization({ (status) in
        if status == .authorized {
          DispatchQueue.main.async {
            self.addPhotoImagePicker.sourceType = .photoLibrary
            self.viewController.present(self.addPhotoImagePicker, animated: true)
          }
        }
        else if status == .denied {
          
        }
      })
    } else {
      self.addPhotoImagePicker.sourceType = .photoLibrary
      self.viewController.present(self.addPhotoImagePicker, animated: true)
    }
  }
  public func camera(){
    if !UIImagePickerController.isSourceTypeAvailable(.camera) {
      PHPhotoLibrary.requestAuthorization({ (status) in
        if status == .authorized {
          DispatchQueue.main.async {
            self.addPhotoImagePicker.sourceType = .camera
            self.viewController.present(self.addPhotoImagePicker, animated: true)
          }
        }
        else if status == .denied {
          
        }
      })
    } else {
      self.addPhotoImagePicker.sourceType = .camera
      self.viewController.present(self.addPhotoImagePicker, animated: true)
    }
  }
  init(viewController: UIViewController) {
    self.viewController = viewController
  }
}
