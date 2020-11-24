//
//  ProgramTableCell.swift
//  ChurchApp
import UIKit

class ProgramTableCell: UITableViewCell, LoadNidoble {
  
  @IBOutlet weak var dataProgrammLabel : UILabel!
  @IBOutlet weak var titleProgrammLabel: UILabel!
  
  public var programm: DECProgram?
 
  private var controllers: WorshipControllers!
  
  public func configure(controllers: WorshipControllers?, programm: DECProgram?){
    self.controllers = controllers
    self.programm    = programm
    self.controllers.present.programmTable(cell: self)
  }
  
}
