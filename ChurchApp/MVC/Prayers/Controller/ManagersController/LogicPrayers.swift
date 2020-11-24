//
//  LogicPrayers.swift
//  ChurchApp

import Foundation

class LogicPrayers: Controller {
  
  //MARK: - Public variable
  public var VC: PrayersViewController!
  
  public func viewDidLoad() {
    self.commonLogic()
  }
  public func presentPrayer(prayer: DECPrayer){
    
    if let content = prayer.content, !content.isEmpty  {
      let prayerText = GDPrayerText(prayer: prayer)
      self.VC.controllers.router.push(.PrayerTextVC(prayerText))
      
    } else if let subPrays = prayer.subPrays, !subPrays.isEmpty  {
      let idString = String(prayer.ID ?? 0)
      let idInt    = prayer.ID ?? 0
      self.getPrayID(id: idString)
      self.VC.goPrayers.append(idInt)
      
    } else if let prays = prayer.prays, !prays.isEmpty {
      let idString = String(prayer.ID ?? 0)
      let idInt    = prayer.ID ?? 0
      self.getPrayID(id: idString)
      self.VC.goPrayers.append(idInt)
    } else {
      
      let idString = String(prayer.ID ?? 0)
      let idInt    = prayer.ID ?? 0
      self.getPrayID(id: idString)
      self.VC.goPrayers.append(idInt)
    }
  }
  public func backButton(){
    if !self.VC.goPrayers.isEmpty {
      self.VC.goPrayers.removeLast()
      let id = String(self.VC.goPrayers.last ?? 0)
      self.getPrayID(id: id)
      if self.VC.goPrayers.isEmpty {
        self.commonLogic()
      }
    } else {
      self.VC.dismiss(animated: true, completion: nil)
    }
  }
}
//MARK: - Private functions
extension LogicPrayers {
  
  public func commonLogic(){
    
    //1 - Получаем данные
    self.VC.controllers.server.getPrays { (prayers) in
      
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerPrays.check(prays: prayers) else { return }
      
      //3 - Презентуем данные
      self.VC.controllers.present.prayersTable(prayers: prayers!)
      self.VC.controllers.present.navBarTitleLabel()
    }
  }
  private func getPrayID(id: String){
  
    //1 - Получаем данные
    self.VC.controllers.server.getPrayID(id: id) { (prayer) in
      
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerPrayerID.check(prayer: prayer) else { return }
      
      //3 - Презентуем данные
      if let subPrays = prayer!.subPrays, !subPrays.isEmpty {
        self.VC.controllers.present.prayersTable(prayers: prayer!.subPrays!)
        self.VC.controllers.present.navBarTitleLabel(prayer: prayer!)
        return
      }
     
      if let prays = prayer!.prays, !prays.isEmpty {
        self.VC.controllers.present.prayersTable(prayers: prayer!.prays!)
        self.VC.controllers.present.navBarTitleLabel(prayer: prayer!)
        return
      }
      
      if let prays = prayer {
        self.VC.controllers.present.prayersTable(prayers: [prays])
        self.VC.controllers.present.navBarTitleLabel(prayer: prayer!)
        return
      }
    }
  }
}
//MARK: - Initial
extension LogicPrayers{
  
  //MARK: - Inition
  convenience init(viewController: PrayersViewController) {
    self.init()
    self.VC = viewController
  }
}

