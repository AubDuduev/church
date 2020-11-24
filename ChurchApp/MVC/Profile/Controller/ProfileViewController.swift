//
//  ProfileViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 12.08.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit
import NVActivityIndicatorView
import FlagPhoneNumber

class ProfileViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: ProfileControllers!
  
  //MARK: - Public variable
  public let server               = Server()
  public let errorHandlerUserData = ErrorHandlerUserData()
  public let imagePikerController = UIImagePickerController()
  public var loadingUploadPhoto   : NVActivityIndicatorView!
  public var photoLibrary         : PhotoLibrary!
  
  //MARK: - Outlets
  @IBOutlet weak var userAvatarImageView: UIImageView!
  @IBOutlet weak var saveButton         : UIButton!
  @IBOutlet weak var userNameView       : UIView!
  @IBOutlet weak var userNumberView     : UIView!
  @IBOutlet weak var userNameTextField  : UITextField!
  @IBOutlet weak var userNumberTextField: FPNTextField!
  @IBOutlet weak var userIDTextField    : UITextField!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = ProfileControllers(viewController: self)
  }
}
