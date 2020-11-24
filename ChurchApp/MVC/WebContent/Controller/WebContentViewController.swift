//
//  WebContentViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 20.07.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import WebKit
import UIKit

class WebContentViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: WebContentControllers!
  
  //MARK: - Public variable
  public var activeUrl: String!
  
  //MARK: - Outlets
  @IBOutlet weak var webView: WKWebView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = WebContentControllers(viewController: self)
  }
}
