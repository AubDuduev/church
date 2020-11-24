//
//  ChoosePSViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 30.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class ChoosePSViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: ChoosePSControllers!
  
  //MARK: - Public variable
  public var choosePSData: ChoosePSData!
  public var cellState   : [ChoosePSCellState]!
  public var callBack    : Clousure<CallBackChoosePS>!
  public var data        : [ENCKeyValue]!
  
  //MARK: - Outlets
  @IBOutlet weak var choosePSTable: ChoosePSTable!
  @IBOutlet weak var commonView   : UIView!
  @IBOutlet weak var doneButton   : UIView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = ChoosePSControllers(viewController: self)
  }
}
