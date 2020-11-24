//
//  ServicesViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ServicesViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: ServicesControllers!
  
  //MARK: - Public variable
  public let server               = Server()
  public let errorHandlerServices = ErrorHandlerServices()
  public let errorHandlerPrice    = ErrorHandlerPrice()
  public var price                : Int!
  public var prices               : DECPrice!
  public var orderType            : OrderType!
  
  //MARK: - Outlets
  @IBOutlet weak var servicesTable: ServicesTable!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = ServicesControllers(viewController: self)
  }
}
