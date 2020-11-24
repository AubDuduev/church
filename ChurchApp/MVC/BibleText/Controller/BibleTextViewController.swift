//
//  BibleTextViewController.swift
//  ChurchApp
//
//  Created by Senior Developer on 04.10.2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class BibleTextViewController: UIViewController {
  
  //MARK: - Controllers
  public var controllers: BibleTextControllers!
  
  //MARK: - Public variable
  public var bibleTextData         : BibleTextData!
  public var bibleText             : DECBibleText!
  public var currentPoemIndex      = 0
  public let server                = Server()
  public let errorHandlerBibleText = ErrorHandlerBibleText()
  public var currentTranslateIndex = 0
  
  //MARK: - Outlets
  @IBOutlet weak var textBibleTable       : BibleTextTable!
  @IBOutlet weak var chapterPicker        : ChapterPicker!
  @IBOutlet weak var poemPicker           : PoemPicker!
  @IBOutlet weak var translatePicker      : TranslatePicker!
  @IBOutlet weak var poemPickerView       : UIView!
  @IBOutlet weak var chapterPickerView    : UIView!
  @IBOutlet weak var translatePickerView  : UIView!
  @IBOutlet weak var navBarTitleLabel     : UILabel!
  @IBOutlet weak var previousChapterButton: UIButton!
  @IBOutlet weak var nextChapterButton    : UIButton!
  @IBOutlet weak var editTextButton       : UIButton!
  @IBOutlet weak var changeView           : UIView!
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setControllers()
    self.controllers.setup.viewDidLoad()
    self.controllers.logic.viewDidLoad()
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    self.controllers.setup.viewDidLayoutSubviews()
  }
  private func setControllers(){
    self.controllers = BibleTextControllers(viewController: self)
  }
}
