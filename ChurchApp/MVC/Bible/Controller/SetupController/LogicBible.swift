//
//  LogicBible.swift
//  ChurchApp

import UIKit

class LogicBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  public func changeBibleTestament(control: UISegmentedControl){
    let testament = BibleTestament.allCases[control.selectedSegmentIndex]
    self.VC.controllers.present.bibleTable(bible: self.VC.bibles?.testament(testament))
  }
  public func pushBibleText(indexPath: IndexPath){
    let bible       = self.VC.bibleTable.bible
    let bookID      = bible?.storages[indexPath.section].books?[indexPath.row].ID
    let canonicalID = bible?.storages[indexPath.section].covenantID
    let bibleTextData = BibleTextData(bookID: bookID, canonical: canonicalID)
    self.VC.controllers.router.push(.BibleText(bibleTextData))
  }
}
//MARK: - Private functions
extension LogicBible {
  
  public func commonLogic(){
    
    //1 - Получаем данные
    self.VC.controllers.server.getBible { (bibles) in
      
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerBible.check(bible: bibles) else { return }
      
      //3 - Презентуем данные
      self.VC.controllers.present.bibleTable(bible: bibles?.testament(.New))
      self.VC.bibles = bibles
    }
  }
}
//MARK: - Initial
extension LogicBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

