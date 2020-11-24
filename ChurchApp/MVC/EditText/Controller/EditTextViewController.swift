//
//  EditTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class EditTextViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: EditTextControllers!
  
  //MARK: - Public variable
  public var editTextColback: Clousure<GDEditText>!
  public var fontTypeText   : GDEditText.FontTypeText!   = .Display
  public var colorTypeText  : GDEditText.ColorTypeText!  = .Black
  public var colorBGText    : GDEditText.BGColorTypeText = .BlackBG
  public var fontSize       : CGFloat! = 16
  
  //MARK: - Outlets
  @IBOutlet var brightnessSlider: UISlider!
  
  //MARK: - Outlets array
  @IBOutlet var fontChekmarkButtons: [UIButton]!
  @IBOutlet var colorImages        : [UIImageView]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = EditTextControllers(viewController: self)
  }
}
