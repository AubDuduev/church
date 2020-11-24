//
//  PopOverViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 14.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class PopOverViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: PopOverControllers!
  
  //MARK: - Public variable
  
  
  //MARK: - Outlets
 
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
   
  }
  private func setControllers(){
    self.controllers = PopOverControllers(viewController: self)
  }
}
