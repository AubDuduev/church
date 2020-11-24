//
//  SetupBibleText.swift
//  ChurchApp

import Foundation

class SetupBibleText: Controller {
  
  //MARK: - Public variable
  public var VC: BibleTextViewController!
  
  public func viewDidLoad() {
    self.textBibleTable()
    self.translatePicker()
    self.chapterPicker()
    self.poemPicker()
  }
  public func viewDidLayoutSubviews() {
    self.translatePickerView()
    self.poemPickerView()
    self.chapterPickerView()
    self.previousNextButton()
  }
}
//MARK: - Private functions
extension SetupBibleText {
  
  private func textBibleTable(){
    self.VC.textBibleTable.controllers = self.VC.controllers
    self.VC.textBibleTable.tableView?.backgroundColor = GVeditText.colorBG
  }
  private func poemPickerView(){
    self.VC.poemPickerView.cornerRadius(5, true)
    self.VC.poemPickerView.backgroundColor = .set(.buttonYellow)
  }
  private func chapterPickerView(){
    self.VC.chapterPickerView.cornerRadius(5, true)
    self.VC.chapterPickerView.backgroundColor = .set(.buttonYellow)
  }
  private func translatePickerView(){
    self.VC.translatePickerView.cornerRadius(5, true)
    self.VC.translatePickerView.backgroundColor = .set(.buttonYellow)
  }
  public func translatePicker(){
    self.VC.translatePicker.controllers =  self.VC.controllers
  }
  public func chapterPicker(){
    self.VC.chapterPicker.controllers =  self.VC.controllers
  }
  public func poemPicker(){
    self.VC.poemPicker.controllers =  self.VC.controllers
  }
  public func previousNextButton(){
    self.VC.previousChapterButton.cornerRadius(3, false)
    self.VC.nextChapterButton.cornerRadius(3, false)
    self.VC.previousChapterButton.shadowColor(color: .lightGray, radius: 3)
    self.VC.nextChapterButton.shadowColor(color: .lightGray, radius: 3)
  }
}
//MARK: - Private functions
extension SetupBibleText {
  
  public func setup(cell: BibleTextTableCell){
    cell.contentLabel.font            = GVeditText.font
    cell.contentLabel.backgroundColor = GVeditText.colorBG
    cell.contentLabel.textColor       = GVeditText.colorText
    cell.backgroundColor              = GVeditText.colorBG
  }
}
//MARK: - Initial
extension SetupBibleText{
  
  //MARK: - Inition
  convenience init(viewController: BibleTextViewController) {
    self.init()
    self.VC = viewController
  }
}

