//
//  OrdersViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 28.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class OrdersViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: OrdersControllers!
  
  //MARK: - Public variable
  public let server             = Server()
  public let errorHandlerOrders = ErrorHandlerOrders()
  
  //MARK: - Outlets
  @IBOutlet weak var ordersTable: OrdersTable!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = OrdersControllers(viewController: self)
  }
}
