//
//  DonationsViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 27.06.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class DonationsViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: DonationsControllers!
  
  //MARK: - Public variable
  public let errorHandlerDonations = ErrorHandlerDonations()
  public var animationControllCard : AnimationControllCard!
  public var progressChartView     = ProgressChartView().loadNib()
  public var progressTimeAnimation : CADisplayLink!
  public var progressSumma         : Int = 0
  public var progressProcent       : Int = 0
  public var server                = Server()
  
  //MARK: - Outlets
  @IBOutlet weak var currentSumLabel       : UILabel!
  @IBOutlet weak var currentSumProcentLabel: UILabel!
  @IBOutlet weak var descriptionTextView   : UITextView!
  @IBOutlet weak var navBarView            : UIView!
  @IBOutlet weak var descriptionView       : UIView!
  @IBOutlet weak var progressDonationView  : UIView!
  @IBOutlet weak var donationsButton       : UIButton!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.controllers.setup.viewWillAppear()
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.controllers.setup.viewDidAppear()
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.controllers.setup.viewDidLayoutSubviews()
    self.controllers.animation.viewDidLayoutSubviews()
  }
  private func setControllers(){
    self.controllers = DonationsControllers(viewController: self)
  }
}
