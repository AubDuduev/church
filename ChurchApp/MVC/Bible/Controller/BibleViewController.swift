//
//  BibleViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BibleViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: BibleControllers!
  
  //MARK: - Public variable
  public let server            = Server()
  public let errorHandlerBible = ErrorHandlerBible()
  public var bibles            : [DECBible]?
  
  //MARK: - Outlets
  @IBOutlet weak var bibleTable: BibleTable!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
    
  }
  private func setControllers(){
    self.controllers = BibleControllers(viewController: self)
  }
}
