//
//  RegistrationViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import SwiftEntryKit
import UIKit

class RegistrationViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: RegistrationControllers!
  
  //MARK: - Public variable
  public var attributesICV = EKAttributes()
  
  //MARK: - Outlets
  @IBOutlet weak var registrationButtonView: UIView!
  @IBOutlet weak var infoChurcheView       : UIView!
  @IBOutlet weak var infoChurcheButton     : UIButton!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = RegistrationControllers(viewController: self)
  }
}
