//
//  PrayersViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 09.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class PrayersViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: PrayersControllers!
  
  //MARK: - Public variable
  public let errorHandlerPrays    = ErrorHandlerPrays()
  public let errorHandlerPrayerID = ErrorHandlerPrayerID()
  public let server               = Server()
  public var goPrayers            = [Int]()
  
  //MARK: - Outlets
  @IBOutlet weak var prayersTable    : PrayersTable!
  @IBOutlet weak var navBarTitleLabel: UILabel!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = PrayersControllers(viewController: self)
  }
}
