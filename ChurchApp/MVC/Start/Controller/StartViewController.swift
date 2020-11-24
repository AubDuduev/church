//
//  StartViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class StartViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: StartControllers!
  
  public let server      = Server()
  public var startScreens : [DECStartScreen]!
  public var viewParent   : ViewParentStartScreen = .LoadingVC
  
  //MARK: - Public variable
  public var pageIndex = 0
  
  //MARK: - Outlets
  @IBOutlet weak var titleDescriptionLabel    : UILabel!
  @IBOutlet weak var textDescriptionLabel     : UILabel!
  @IBOutlet weak var imageDescriptionImageView: UIImageView!
  
  //MARK: - Array outlets
  @IBOutlet var pagesImageViews: [UIImageView]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = StartControllers(viewController: self)
  }
}
