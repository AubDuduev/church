//
//  PopUpBibleTextDelegate.swift
//  ChurchApp
//
//  Created by Senior Developer on 10.11.2020.
//  Copyright © 2020 Developer. All rights reserved.
//
import UIKit

extension BibleTextViewController: UIPopoverPresentationControllerDelegate {
  
  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
}
