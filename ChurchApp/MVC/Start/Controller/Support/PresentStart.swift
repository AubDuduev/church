//
//  PresentStart.swift
//  ChurchApp
import SDWebImage
import Foundation

class PresentStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  public func dataController(){
    let screenImageURL = self.VC.startScreens[self.VC.pageIndex].image
    let pageImageURL = self.VC.server.urls.get(type: .store(screenImageURL)).URL
    print(pageImageURL!.absoluteString)
    self.VC.imageDescriptionImageView.sd_setImage(with: pageImageURL) { (_, error, _, _) in
      if let error = error {
        print("Error set pageImageURL - \(pageImageURL?.absoluteString ?? "nil") - ", error.localizedDescription)
      } else {
        
      }
    }
    self.VC.pagesImageViews.forEach{$0.set(nameImage: .circlePageStartNoChange)}
    self.VC.pagesImageViews[self.VC.pageIndex].set(nameImage: .circlePageStarChange)
    self.VC.textDescriptionLabel.text  = self.VC.startScreens[self.VC.pageIndex].text
    self.VC.titleDescriptionLabel.text = self.VC.startScreens[self.VC.pageIndex].title
  }
}
//MARK: - Initial
extension PresentStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

