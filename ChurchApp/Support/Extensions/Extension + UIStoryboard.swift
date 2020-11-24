//
//  Extension + UIStoryboard.swift
//  PhotoGalery
//
//  Created by Aleksandr on 15.10.2019.
//  Copyright © 2019 Aleksandr. All rights reserved.
//
import UIKit

extension UIStoryboard {
  
  static func create(sbID: UIStoryboard.ID, _ bnundleID: BundleID? = nil) -> UIStoryboard {
    var bundle: Bundle?
    if let bundleID = bnundleID {
      bundle = Bundle(identifier: bundleID.rawValue)
    }
    return UIStoryboard(name: sbID.rawValue, bundle: bundle)
  }
  static func createVC(sbID: UIStoryboard.ID, _ bnundleID: BundleID? = nil) -> UIViewController {
    var bundle: Bundle?
    if let bundleID = bnundleID {
      bundle = Bundle(identifier: bundleID.rawValue)
    }
    
    let storyBoard     = UIStoryboard(name: sbID.rawValue, bundle: bundle)
    let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
    return viewController
  }
  
  static func createVCID(sbID: UIStoryboard.ID, vcID: UIViewController.IDVC, _ bnundleID: BundleID? = nil) -> UIViewController {
    var bundle        : Bundle?
    var viewController: UIViewController!
    if let bundleID = bnundleID {
      bundle = Bundle(identifier: bundleID.rawValue)
    }
    let storyBoard     = UIStoryboard(name: sbID.rawValue, bundle: bundle)
    if #available(iOS 13.0, *) {
       viewController = storyBoard.instantiateViewController(identifier: vcID.rawValue)
    } else {
      // Fallback on earlier versions
    }
    return viewController
  }
  enum ID: String, CaseIterable {
    
    case Loading
    case News
    case Services
    case Worship
    case Chat
    case Other
    case Start
    case MainTabBar
    case Registration
    case FullVideo
    case FullPhoto
    case Bakery
    case Note
    case Donations
    case BakeryInfo
    case Stream
    case MakeDonation
    case PopOver
    case WebContent
    case Profile
    case PayNote
    case Orders
    case Abaut
    case Contacts
    case ChoosePS
    case Bible
    case BibleText
    case Prayers
    case PrayerText
    case EditText
  }
  enum BundleID: String, CaseIterable {
    
    case Some
  }
}

