//
//  BakeryInfoViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 26.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BakeryInfoViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: BakeryInfoControllers!
  
  //MARK: - Public variable
  public var product: DECProduct?
  
  //MARK: - Outlets
  @IBOutlet weak var commonView      : UIView!
  @IBOutlet weak var cornerRadiusView: UIView!
  @IBOutlet weak var countButtonView : UIView!
  @IBOutlet weak var buyButton       : UIButton!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = BakeryInfoControllers(viewController: self)
  }
}
