//
//  MakeDonationViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class MakeDonationViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers    : MakeDonationControllers!
  public let server         = Server()
  public let errorHandler   = ErrorHandlerOrder()
  public var requrrentPeriod: RecurrentType! = .OneWeak
  
  //MARK: - Outlets
  @IBOutlet weak var commonView        : UIView!
  @IBOutlet weak var cornerRadiusView  : UIView!
  @IBOutlet weak var changeDaysView    : UIView!
  @IBOutlet weak var makeDonationView  : UIView!
  @IBOutlet weak var chekmarkButton    : UIButton!
  @IBOutlet weak var infoDonationButton: UIButton!
  @IBOutlet weak var recurrentButton   : UIButton!
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var summTextField: UITextField!
  
  //MARK: - Outlets
  @IBOutlet var textFieldsViews    : [UIView]!
  @IBOutlet var daysDonationButtons: [UIButton]!
 
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.present.viewDidLoad()
    self.controllers.animation.viewDidLoad()
  }
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.controllers.logic.viewWillDisappear()
  }
  private func setControllers(){
    self.controllers = MakeDonationControllers(viewController: self)
  }
}
