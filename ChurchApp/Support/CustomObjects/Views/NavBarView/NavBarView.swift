//
//  NavTabBar.swift
//  DgBetTrip
//
//  Created by Senior Developer on 01.05.2020.
//  Copyright © 2020 Senior Developer. All rights reserved.
//
import UIKit

class NavBarView: UIView {
  
  private var chaildIndexVC = 0
  
  @IBOutlet weak var avatarImageView : UIImageView!
  @IBOutlet weak var titleNavBarLabel: UILabel!
  
  private let server = Server()
  
  public func setup(){
    self.backgroundColor = .set(.navBarFon)
    self.avatarImageView.cornerRadius(22.5, true)
    self.avatarImageView.borderColor(.gray, 0.5)
    self.shadowColor(color: .lightGray, radius: 7)
  }
  public func chaildVC(index: Int){
    self.chaildIndexVC = index
  }
  public func setUserData(index: Int){
    self.titleNavBarLabel.text = NavBarTitle.allCases[index].rawValue
    let URL = self.server.urls.get(type: .store(GVuserData.avatarURL ?? "")).URL
    self.avatarImageView.sd_setImage(with: URL) { [weak self] (_, error, _, _) in
      if let error = error {
        self?.avatarImageView.image = #imageLiteral(resourceName: "userChurcheApp")
        print("Error set avatar user nav bar , Class: NavTabBar", "Localized: \(error.localizedDescription)")
      }
    }
  }
  @IBAction func presentProfileVCButton(_ sender: UIButton) {
    UIApplication.VC(type: .TabBarVC(chaildIndexVC)).pushVC(storyboardID     : .Profile,
                                                            transitionStyle  : .coverVertical,
                                                            presentationStyle: .fullScreen)
  }
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
