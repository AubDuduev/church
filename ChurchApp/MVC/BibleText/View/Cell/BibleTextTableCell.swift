//
//  BibleTextTableCell.swift
//  ChurchApp
import UIKit

class BibleTextTableCell: UITableViewCell, LoadNidoble {
 
  private var controllers: BibleTextControllers!
  
  @IBOutlet weak var contentLabel: UILabel!
  
  public func configure(controllers: BibleTextControllers?, verses: DECChapterVerses?, translate: TranslateBible){
    self.controllers = controllers
    switch translate {
      case .content:
        self.contentLabel.text = verses?.content?.htmlToString
      case .contentC:
        self.contentLabel.text = verses?.contentC?.htmlToString
      case .contentG:
        self.contentLabel.text = verses?.contentG?.htmlToString
      case .contentI:
        self.contentLabel.text = verses?.contentI?.htmlToString
      case .contentL:
        self.contentLabel.text = verses?.contentL?.htmlToString
    }
    self.controllers.setup.setup(cell: self)
  }
 
}
