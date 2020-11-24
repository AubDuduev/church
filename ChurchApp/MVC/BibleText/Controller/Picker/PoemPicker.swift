//
//  PoemPicker.swift
//  ChurchApp
//
//  Created by Senior Developer on 08.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class PoemPicker: NSObject {
  
  public var verses     : [DECChapterVerses]!
  public var controllers: BibleTextControllers!
  public var pickerView : UIPickerView!
}

//MARK: --- DataSource PickerView
extension PoemPicker: UIPickerViewDelegate {

  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    self.pickerView = pickerView
    return pickerView.frame.height
  }
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    self.pickerView = pickerView
    return pickerView.frame.width
  }
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    self.pickerView = pickerView
    let pickerView = PickerView(picker: pickerView)
    var text = ""
    if row == 0 {
      text = "Все"
    } else {
      text = "\(row)"
    }
    pickerView.setup(textSize: 14, text: text, centerLabel: 0, heightV: 0)
  return pickerView
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.controllers?.logic.textBibleTablePoem(poemIndex: row)
  }
}
//MARK: --- Delegate PickerView
extension PoemPicker: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    self.pickerView = pickerView
  return 1
  }
 
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    self.pickerView = pickerView
    switch component {
      case 0:
        return ((verses?.count ?? 0) + 1)
      default:
        return 0
    }
  }
}


