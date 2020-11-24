//
//  PresentNote.swift
//  ChurchApp

import Foundation

class PresentNote: Controller {
  
  //MARK: - Public variable
  public var VC: NoteViewController!
  
  public func viewDidLoad() {
    self.noteData()
    self.backgraundImageView()
  }

  public func backgraundImageView(){
    guard let image = self.VC.noteData.service.backgraundfon else { return }
    guard let url   = self.VC.server.urls.get(type: .store(image)).URL else { return }
    self.VC.backgraundImageView.isSkeletonable = true
    self.VC.backgraundImageView.showAnimatedGradientSkeleton()
    self.VC.backgraundImageView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .set(.projectBlue)))
    self.VC.backgraundImageView.sd_setImage(with: url) { (_, error, _, url) in
      
      if let error = error {
        print("Error load image backgraundImageView, Class: PresentPayNote", "Localized: \(error.localizedDescription)")
      } else {
        self.VC.backgraundImageView.hideSkeleton()
      }
    }
  }
}
//MARK: - Private functions
extension PresentNote {
  
  private func noteData(){
    self.VC.titleNoteLabel.text   = self.VC.noteData.service.title
    self.VC.descriptionLabel.text = self.VC.noteData.service.description
  }
}
//MARK: - Initial
extension PresentNote{
  
  //MARK: - Inition
  convenience init(viewController: NoteViewController) {
    self.init()
    self.VC = viewController
  }
}

