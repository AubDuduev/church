//
//  LoadingViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 22.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import NVActivityIndicatorView
import UIKit

class LoadingViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: LoadingControllers!
  
  //MARK: - Public variable
  public let typeURLGetServer     : URLString.Url = .urlProdaction
  public var animationLoading     : AnimationLoading!
  public let server               = Server()
  public let coreData             = CoreData()
  public let networkManager       = Network()
  public let semaphoreGetUserData = DispatchSemaphore(value: 0)
 
  
  //MARK: - Outlets
  @IBOutlet var animationLoadingView: NVActivityIndicatorView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.logic.viewDidLoad()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.controllers.logic.viewDidAppear()
    self.controllers.animation.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = LoadingControllers(viewController: self)
  }
}
