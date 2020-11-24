//
//  LogicWorship.swift
//  ChurchApp
import SwiftEntryKit
import Foundation

class LogicWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  public func viewWillAppear() {
    self.commonLogic()
  }
  public func viewWillDisappear() {
    self.dismissAlertEK()
  }
}
//MARK: - Private functions
extension LogicWorship {
  
  private func commonLogic(){
    //1 - Получаем список служб
    self.VC.controllers.server.getWorships { (worships) in
      //2 - Проверяем на ошибки
      guard self.VC.errorHandlerWorships.check(worships: worships) else { return }
      //3 - Презентуем данные в таблице
      let gdWorships = self.createCell(worships: worships)
      self.VC.controllers.present.collectionData(worships: gdWorships)
    }
  }
  private func dismissAlertEK(){
    SwiftEntryKit.dismiss()
  }
  private func createCell(worships: [DECWorship]) -> [GDWorship]{
    var gdWorships = [GDWorship]()
    
    //Проходимся по всему массиву
    for worship in worships {
     
      //Содаем данные с стримом
      if worship.streamInfo?.status == .OnLine {
        let gdWorship = GDWorship(worship: worship, worshipType: .stream)
        gdWorships.append(gdWorship)
      
      //Содаем данные с программой
      } else if worship.streamInfo?.status == .OffLine {
        let gdWorship = GDWorship(worship: worship, worshipType: .program)
        gdWorships.append(gdWorship)
      }
      
    }
    //Сортируем по дате
    gdWorships = gdWorships.sortedDate()
    //Сортируем по все стримы вверху
    gdWorships = gdWorships.sorted{ ($0.worshipType == .stream) && !($1.worshipType == .stream)}
    return gdWorships
  }
}
extension LogicWorship {
  
  public func pauseVideo(cell: StreamCollectionCell){
    cell.videoStreamView.controll.pause()
    self.VC.controllers.animation.hiddenAnimationPlayButton(cell: cell)
  }
}
//MARK: - Initial
extension LogicWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

