//
//  PresentWorship.swift
//  ChurchApp

import Foundation

class PresentWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  public func collectionData(worships: [GDWorship]){
    self.VC.worshipCollection.worships = worships
    self.VC.worshipCollection.collectionView.reloadData()
  }
}
//Презентуем данные на таблице программ
extension PresentWorship {
  
  public func programmTable(cell: ProgramTableCell){
    cell.dataProgrammLabel.text  = Double(cell.programm?.date ?? 0).format(.time)
    cell.titleProgrammLabel.text = cell.programm?.title
  }
}
//Презентуем данные на колекции служб
extension PresentWorship {
  
  public func worshipCollection(cell: WorshipCollectionCell, worship: GDWorship?){
    self.VC.programTable.programms   = worship?.program
    self.VC.programTable.controllers = self.VC.controllers
    cell.programTableView.reloadData()
  }
  public func data(cell: WorshipCollectionCell){
    cell.nameProgramLabel.text = cell.worship?.event
    cell.dateProgramLabel.text = Double(cell.worship?.date ?? 0).format(.dayMonthText)
  }
}
//Презентуем данные на в ячеики стрим
extension PresentWorship {
  
  public func streamCell(cell: StreamCollectionCell){
    cell.dateStreamLabel.text    = Double(cell.worship?.date ?? 0).format(.dayMonthText)
    cell.timeStreamLabel.text    = Double(cell.worship?.date ?? 0).format(.time)
    cell.eventProgrammLabel.text = cell.worship?.event
    cell.titleProgrammLabel.text = cell.worship?.program?.first?.title
  }
  public func onLine(cell: StreamCollectionCell){
    cell.onLineView.isHidden = true
    guard cell.worship.streamInfo?.status == .OnLine else { return }
    cell.onLineView.isHidden = false
  }
  public func imageSteam(cell: StreamCollectionCell){
    guard let stringURL = cell.worship.streamInfo?.image else { return }
    let url = URL(string: stringURL)
    cell.streamImageView.isSkeletonable = true
    cell.streamImageView.showAnimatedGradientSkeleton()
    cell.streamImageView.sd_setImage(with: url) { (_, error, _, url) in
      if error == nil {
        cell.streamImageView.hideSkeleton()
      }
    }
  }
  public func videoStream(cell: StreamCollectionCell, stringURL: String?){
    cell.playButtonLabel.isHidden = true
    cell.videoStreamView.video(url: .network(stringURL), type: .mp4)
  }
}
//MARK: - Initial
extension PresentWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

