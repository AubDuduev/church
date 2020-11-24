//
//  PresentBibleText.swift
//  ChurchApp

import Foundation

class PresentBibleText: Controller {
  
  //MARK: - Public variable
  public var VC: BibleTextViewController!
  
  
  public func textBibleTable(bibleText: DECBibleText?){
    self.VC.textBibleTable.poems = bibleText?.verses
    self.VC.textBibleTable.tableView.reloadData()
  }
  public func navBarTitleLabel(bibleText: DECBibleText?){
    self.VC.navBarTitleLabel.text = bibleText?.name
  }
  public func chapterPicker(chapter: [DECBibleChapters]?){
    self.VC.chapterPicker.chapters = chapter
    self.VC.chapterPicker.pickerView.reloadInputViews()
    self.VC.chapterPicker.pickerView.reloadAllComponents()
  }
  public func poemPicker(poem: [DECChapterVerses]?){
    self.VC.poemPicker.verses = poem
    self.VC.poemPicker.pickerView.reloadInputViews()
    self.VC.poemPicker.pickerView.reloadAllComponents()
  }
  
}
//MARK: - Initial
extension PresentBibleText{
  
  //MARK: - Inition
  convenience init(viewController: BibleTextViewController) {
    self.init()
    self.VC = viewController
  }
}

