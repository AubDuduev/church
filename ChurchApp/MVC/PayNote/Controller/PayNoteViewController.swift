//
//  PayNoteViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 16.09.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class PayNoteViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: PayNoteControllers!
  
  //MARK: - Public variable
  public var noteData       : NoteData!
  public let server         = Server()
  public var order          : ENCOrder!
  public var recurrentType  : RecurrentType = .OneDay
  public let errorHandler   = ErrorHandlerOrder()
  public var currentSumm    : Float!
  public var dataIcons      : [ENCKeyValue]!
  public var dataSaints     : [ENCKeyValue]!
  
  //MARK: - Outlets
  @IBOutlet weak var commonView         : UIView!
  @IBOutlet weak var cornerRadiusView   : UIView!
  @IBOutlet weak var commonImageView    : UIImageView!
  @IBOutlet weak var backgraundImageView: UIImageView!
  @IBOutlet weak var changeDaysView     : UIView!
  @IBOutlet weak var makeDonationView   : UIView!
  @IBOutlet weak var checkMarkButton    : UIButton!
  @IBOutlet weak var payButton          : UIButton!
  @IBOutlet weak var payButtonLabel     : UILabel!
  @IBOutlet weak var buttonSvatView     : UIView!
  @IBOutlet weak var buttonIconView     : UIView!
  @IBOutlet weak var sorocoustTypeView  : UIView!
  @IBOutlet weak var commentView        : UIView!
  @IBOutlet weak var buttonMolebenView  : UIView!
  @IBOutlet weak var commentTextField   : UITextField!
  
  @IBOutlet var daysDonationButtons          : [UIButton]!
  @IBOutlet var aboutHealthAboutReposeButtons: [UIButton]!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.animation.viewDidLoad()
    self.controllers.present.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  private func setControllers(){
    self.controllers = PayNoteControllers(viewController: self)
  }
}
