//
//  LogicBibleText.swift
//  ChurchApp
import UIKit
import Foundation

class LogicBibleText: Controller {
  
  //MARK: - Public variable
  public var VC: BibleTextViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  public func textBibleTable(translate: TranslateBible){
    self.VC.textBibleTable.translate = translate
    self.VC.textBibleTable.tableView?.reloadData()
  }
  public func textBibleTableChapter(chapter: Int){
    self.VC.bibleTextData.chpaterID = chapter
    self.commonLogic()
  }
  public func previousNextButton(tag: Int){
    switch tag {
      case 0:
        guard self.VC.bibleTextData.chpaterID > 1 else { return }
        self.VC.bibleTextData.chpaterID -= 1
      case 1:
        guard self.VC.bibleTextData.chpaterID < self.VC.bibleText.chapters!.count else { return }
        self.VC.bibleTextData.chpaterID += 1
      default:
        break
    }
    self.VC.chapterPicker.pickerView.selectRow((self.VC.bibleTextData.chpaterID - 1), inComponent: 0, animated: true)
    self.commonLogic()
  }
  public func textBibleTablePoem(poemIndex: Int){
    guard let versus = self.VC.bibleText.verses else { return }
    self.VC.currentPoemIndex = poemIndex
    if poemIndex != 0 {
      self.VC.textBibleTable.poems = [versus[poemIndex - 1]]
      self.VC.textBibleTable.tableView.reloadData()
    } else {
      self.VC.textBibleTable.poems = self.VC.bibleText.verses
      self.VC.textBibleTable.tableView.reloadData()
    }
  }
  public func share(){
    let controller = UIActivityViewController(activityItems: ["Поделись с друзями"], applicationActivities: nil)
    self.VC.present(controller, animated: true, completion: nil)
  }
  public func switchChapter(button: UIButton){
    self.previousNextButton(tag: button.tag)
  }
  public func switchTranslate(button: UIButton){
    switch button.tag {
      case 0:
        guard self.VC.currentTranslateIndex > 0 else { return }
        self.VC.currentTranslateIndex -= 1
      case 1:
        guard self.VC.currentTranslateIndex < 4 else { return }
        self.VC.currentTranslateIndex += 1
      default:
        break
    }
    print(self.VC.currentTranslateIndex)
    let translate = TranslateBible.allCases[self.VC.currentTranslateIndex]
    self.textBibleTable(translate: translate)
    self.VC.translatePicker.pickerView.selectRow(self.VC.currentTranslateIndex, inComponent: 0, animated: true)
  }
  public func switchPoem(button: UIButton){
    switch button.tag {
      case 0:
        guard self.VC.currentPoemIndex > 0 else { return }
        self.VC.currentPoemIndex -= 1
      case 1:
        guard self.VC.currentPoemIndex < self.VC.bibleText.verses!.count else { return }
        self.VC.currentPoemIndex += 1
      default:
        break
    }
    self.VC.poemPicker.pickerView.selectRow(self.VC.currentPoemIndex, inComponent: 0, animated: true)
    self.textBibleTablePoem(poemIndex: self.VC.currentPoemIndex)
  }
  
  public func setupEditText(editText: GDEditText){
    GVeditText = editText
    self.VC.textBibleTable.tableView.backgroundColor = GVeditText.colorBG
    self.VC.textBibleTable.tableView.reloadData()
//    for cell in self.VC.textBibleTable.tableView.visibleCells {
//      let bibleCell = cell as! BibleTextTableCell
//      let indexPath = self.VC.textBibleTable.tableView.indexPath(for: bibleCell) ?? IndexPath(row: 0, section: 0)
//      self.VC.textBibleTable.tableView.reloadRows(at: [indexPath], with: .none)
//    }
  }
}
//MARK: - Private functions
extension LogicBibleText {
  
  public func commonLogic(){
    
    guard let bibleTextData = self.VC.bibleTextData  else { return }
    //1 - Получаем данные
    self.VC.controllers.server.getTextBible(data: bibleTextData) { (bibleText) in
      
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerBibleText.check(bibleText: bibleText) else { return }
      
      //3 - Презентуем данные
      self.VC.bibleText = bibleText
      self.VC.controllers.present.textBibleTable(bibleText: bibleText)
      self.VC.controllers.present.navBarTitleLabel(bibleText: bibleText)
      
      self.VC.controllers.present.poemPicker(poem: bibleText?.verses)
      self.VC.controllers.present.chapterPicker(chapter: bibleText?.chapters)
    }
  }
}
//MARK: - Initial
extension LogicBibleText{
  
  //MARK: - Inition
  convenience init(viewController: BibleTextViewController) {
    self.init()
    self.VC = viewController
  }
}

