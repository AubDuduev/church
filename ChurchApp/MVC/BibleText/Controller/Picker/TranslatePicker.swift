//
//  TranslatePicker.swift
//  ChurchApp
//
//  Created by Senior Developer on 08.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

class TranslatePicker: NSObject {
  
  public var controllers: BibleTextControllers!
  public var translate  : TranslateBible! = .content
  public var pickerView : UIPickerView!
}

//MARK: --- DataSource PickerView
extension TranslatePicker: UIPickerViewDelegate {

  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    self.pickerView = pickerView
    return pickerView.frame.height
  }
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    self.pickerView = pickerView
    return pickerView.frame.width 
  }
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    let pickerView = PickerView(picker: pickerView)
    let translate = TranslateBible.allCases[row]
    pickerView.setup(textSize: 14, text: translate.translate(), centerLabel: 0, heightV: 0)
  return pickerView
  }
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.translate = TranslateBible.allCases[row]
    self.controllers.logic.textBibleTable(translate: translate)
  }
}
//MARK: --- Delegate PickerView
extension TranslatePicker: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    self.pickerView = pickerView
  return 1
  }
 
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    self.pickerView = pickerView
    switch component {
      case 0:
        return TranslateBible.allCases.count
      default:
        return 0
    }
  }
}


