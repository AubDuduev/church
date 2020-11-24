//
//  LogicChoosePS.swift
//  ChurchApp

import Foundation

class LogicChoosePS: Controller {
  
  //MARK: - Public variable
  public var VC: ChoosePSViewController!
  
  public func viewDidLoad() {
    self.cellState()
  }
  
  public func cellState(){
    
    var cellsState = [ChoosePSCellState]()
    guard let type = self.VC.choosePSData.type else { return }
    
    switch type {
      case .Icon:
        for (index, _) in Icons.allCases.enumerated() {
          let indexPath = IndexPath(row: index, section: 0)
          let cellState = ChoosePSCellState(state: false, indexPath: indexPath)
          cellsState.append(cellState)
        }
      case .Saint:
        for (index, _) in Saints.allCases.enumerated() {
          let indexPath = IndexPath(row: index, section: 0)
          let cellState = ChoosePSCellState(state: false, indexPath: indexPath)
          cellsState.append(cellState)
        }
    }
    self.VC.cellState = cellsState
  }
  public func createData(){
    guard let type = self.VC.choosePSData.type else { return }
    
    switch type {
      case .Icon:
        self.createNameIcon()
      case .Saint:
        self.createNameSaint()
    }
    let returnData = CallBackChoosePS(type: type, data: self.VC.data)
    self.VC.dismiss(animated: true) { [self] in
      self.VC.callBack?(returnData)
    }
  }
}
//MARK: - Private functions
extension LogicChoosePS {
  
  public func createNameIcon(){
    var data  = [ENCKeyValue]()
    var count = 0
    for (_, element) in self.VC.cellState.enumerated() {
      if element.state {
        count += 1
        let newData = ENCKeyValue(key: "Икона №\(count)", value: Icons.allCases[element.indexPath.row].rawValue)
        data.append(newData)
      }
    }
    self.VC.data = data
  }
  public func createNameSaint(){
    var data  = [ENCKeyValue]()
    var count = 0
    for (_, element) in self.VC.cellState.enumerated() {
      if element.state {
        count += 1
        let newData = ENCKeyValue(key: "Святой №\(count)", value: Saints.allCases[element.indexPath.row].rawValue)
        data.append(newData)
      }
    }
  self.VC.data = data
  }
}
//MARK: - Initial
extension LogicChoosePS{
  
  //MARK: - Inition
  convenience init(viewController: ChoosePSViewController) {
    self.init()
    self.VC = viewController
  }
}

