//
//  LogicNote.swift
//  ChurchApp

import Foundation

class LogicNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  public func viewWillDisappear() {
    AlertEK.hide()
  }
  
  public func addName(){
    guard let maxPeople = self.VC.noteData.service.maxPeople else { return }
    guard self.VC.noteTable.names < maxPeople else { return }
    self.VC.noteTable.names += 1
    let row        = self.VC.noteTable.tableView.numberOfRows(inSection: 0)
    let indexPaths = [IndexPath(row: row, section: 0)]
    self.VC.noteTable.tableView.insertRows(at: indexPaths, with: .top)
  }
  public func removeName(){
    guard self.VC.noteTable.names != 1 else { return }
    self.VC.noteTable.names -= 1
    let row        = self.VC.noteTable.tableView.numberOfRows(inSection: 0) - 1
    let indexPaths = [IndexPath(row: row, section: 0)]
    self.VC.noteTable.tableView.beginUpdates()
    self.VC.noteTable.tableView.deleteRows(at: indexPaths, with: .top)
    self.VC.noteTable.tableView.endUpdates()
  }
  public func newOrder(){
    guard let noteTableCells = self.VC.noteTable.tableView.visibleCells as? [NoteTableCell] else { return }
    let allFields = noteTableCells.compactMap{ $0.peopleTextField }
    let fields    = allFields.filter{ $0.text != "" }
    guard let textField = fields.first, textField.check() else {
      AlertEK.dеfault(title: .error, message: .emptyField)
      return
    }
    let data   = fields.compactMap{ ENCKeyValue(key: $0.placeholder, value: $0.text) }
    var amaunt = Float(self.VC.noteData.price * fields.count)
    var recurringPeriod: RecurrentType!
    //Если тип сорокоуст , то уиножаем сумму на 40
    switch self.VC.noteData.orderType {
      case .sorokoust:
        amaunt = amaunt * 40
        recurringPeriod = RecurrentType.FortyDays
      default:
        break
    }
    let newOrder = ENCOrder(type  : self.VC.noteData.orderType,
                            data  : data,
                            period: recurringPeriod,
                            amount: amaunt)
    
    self.VC.controllers.router.push(.PayNoteVC(newOrder))
  }
}
//MARK: - Initial
extension LogicNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

