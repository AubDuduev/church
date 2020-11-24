//
//  Extension + UIViewController.swift
//  PhotoGalery
//
//  Created by Aleksandr on 15.10.2019.
//  Copyright © 2019 Aleksandr. All rights reserved.
//
import UIKit

extension UIViewController {
  
  func pushVCSegueID(sgID: UIStoryboardSegue.SgID? = nil, sgIdTag: Int? = nil, sender: Any? = nil){
    var segue: UIStoryboardSegue.SgID!
    if let sgID = sgID {
      segue = sgID
    } else if let sgIdTag = sgIdTag {
      segue = UIStoryboardSegue.SgID.allCases[sgIdTag]
    }
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
  func pushVCForID(storyboardID: UIStoryboard.ID, vcID: IDVC, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ){
    let storyboard     = UIStoryboard.create(sbID: storyboardID)
    let viewController = storyboard.instantiateViewController(withIdentifier: vcID.rawValue)
    viewController.modalTransitionStyle   = transitionStyle
    viewController.modalPresentationStyle = presentationStyle
    present(viewController, animated: animation)
  }
  func getVCForID(storyboardID: UIStoryboard.ID, vcID: IDVC, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet) -> UIViewController {
    let storyboard     = UIStoryboard.create(sbID: storyboardID)
    let viewController = storyboard.instantiateViewController(withIdentifier: vcID.rawValue)
    viewController.modalTransitionStyle   = transitionStyle
    viewController.modalPresentationStyle = presentationStyle
    return viewController
  }
  func getVC(storyboardID: UIStoryboard.ID? = nil, idStoryBoard: Int? = nil, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ) -> UIViewController{
    var storyBoard = UIStoryboard()
    if let id = idStoryBoard {
      let IDStoryBoard = UIStoryboard.ID.allCases[id].rawValue
      storyBoard = UIStoryboard(name: IDStoryBoard, bundle: nil)
    } else if let storyboardID = storyboardID {
      storyBoard = UIStoryboard(name: storyboardID.rawValue, bundle: nil)
    }
    let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
    viewController.modalTransitionStyle   = .crossDissolve
    viewController.modalPresentationStyle = .overCurrentContext
    return viewController
  }
  func pushVC(storyboardID: UIStoryboard.ID? = nil, idStoryBoard: Int? = nil, animation: Bool = true, transitionStyle: UIModalTransitionStyle = .coverVertical, presentationStyle:  UIModalPresentationStyle = .formSheet ){
    var storyBoard = UIStoryboard()
    if let id = idStoryBoard {
      let IDStoryBoard = UIStoryboard.ID.allCases[id].rawValue
      storyBoard = UIStoryboard(name: IDStoryBoard, bundle: nil)
    } else if let storyboardID = storyboardID {
      storyBoard = UIStoryboard(name: storyboardID.rawValue, bundle: nil)
    }
    let viewController = storyBoard.instantiateInitialViewController() ?? UIViewController()
    viewController.modalTransitionStyle   = .crossDissolve
    viewController.modalPresentationStyle = .overCurrentContext
    self.present(viewController, animated: animation)
  }
  
  enum IDVC: String {
    
    case LoadingVC      = "LoadingViewController"
    case NewsVC         = "NewsViewController"
    case ServicesVC     = "ServicesViewController"
    case WorshipVC      = "WorshipViewController"
    case ChatVC         = "ChatViewController"
    case OtherTVC       = "OtherTableViewController"
    case StartVC        = "StartViewController"
    case MainTabBarVC   = "MainTabBarViewController"
    case RegistrationVC = "RegistrationViewController"
    case FullPhotoVC    = "FullPhotoViewController"
    case FullVideoVC    = "FullVideoViewController"
    case BakeryVC       = "BakeryViewController"
    case NoteVC         = "NoteViewController"
    case DonationsVC    = "DonationsViewController"
    case BakeryInfoVC   = "BakeryInfoViewController"
    case StreamVC       = "StreamViewController"
    case MakeDonationVC = "MakeDonationViewController"
    case PopOverVC      = "PopOverViewController"
    case WebContentVC   = "WebContentViewController"
    case ProfileVC      = "ProfileViewController"
    case PayNoteVC      = "PayNoteViewController"
    case OrdersVC       = "OrdersViewController"
    case AbautVC        = "AbautViewController"
    case ContactsVC     = "ContactsViewController"
    case ChoosePSVC     = "ChoosePSViewController"
    case BibleVC        = "BibleViewController"
    case BibleTextVC    = "BibleTextViewController"
    case PrayersVC      = "PrayersViewController"
    case PrayerTextVC   = "PrayerTextViewController"
    case EditTextVC     = "EditTextViewController"
  }
}
