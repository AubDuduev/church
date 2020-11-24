//
//  SetupTabBar.swift
//  ChurchApp
import UIKit

class SetupMainTabBar: Controller {
  
  //MARK: - Public variable
  public var tabbarVC: MainTabBarViewController!
  
  //MARK: - Public functions
  public func viewDidLoad(){
    self.setDelegates()
    self.setСontrollersInTabBar()
    self.addedAllView()
    self.clickButtontabBarView()
  }
  public func viewWillAppear() {
    
  }
  public func viewDidLayoutSubviews() {
    self.safeAreaBottomView()
    self.safeAreaTopView()
    self.tabBarView()
    self.navigationBarView()
  }
}
//MARK: - Private functions
extension SetupMainTabBar {
  
  private func setСontrollersInTabBar(){
    self.tabbarVC.setViewControllers(self.tabbarVC.controllers.logic.createVcForTabBar(), animated: true)
  }
  //MARK: - Set any delegates
  private func setDelegates(){
    self.tabbarVC.delegate = self.tabbarVC
  }
  private func tabBarView(){
    self.tabbarVC.tabBarView.translatesAutoresizingMaskIntoConstraints = false
    self.tabbarVC.tabBarView.heightAnchor.constraint(equalToConstant: 75).isActive = true
    self.tabbarVC.tabBarView.leadingAnchor.constraint(equalTo: self.tabbarVC.tabBar.leadingAnchor).isActive = true
    self.tabbarVC.tabBarView.trailingAnchor.constraint(equalTo: self.tabbarVC.tabBar.trailingAnchor).isActive = true
    self.tabbarVC.tabBarView.bottomAnchor.constraint(equalTo: self.tabbarVC.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
  }
  private func clickButtontabBarView(){
    self.tabbarVC.tabBarView.setup(controllers: self.tabbarVC.controllers)
    self.tabbarVC.controllers.logic.changeSectionTabBarButton(index: 0)
  }
  private func safeAreaBottomView(){
    self.tabbarVC.safeAreaBottomView.translatesAutoresizingMaskIntoConstraints = false
    self.tabbarVC.safeAreaBottomView.bottomAnchor.constraint(equalTo: self.tabbarVC.view.bottomAnchor).isActive = true
    self.tabbarVC.safeAreaBottomView.leadingAnchor.constraint(equalTo: self.tabbarVC.view.leadingAnchor).isActive = true
    self.tabbarVC.safeAreaBottomView.trailingAnchor.constraint(equalTo: self.tabbarVC.view.trailingAnchor).isActive = true
    self.tabbarVC.safeAreaBottomView.topAnchor.constraint(equalTo: self.tabbarVC.tabBarView.bottomAnchor).isActive = true
    self.tabbarVC.safeAreaBottomView.setup()
  }
  private func safeAreaTopView(){
    self.tabbarVC.safeAreaTopView.translatesAutoresizingMaskIntoConstraints = false
    self.tabbarVC.safeAreaTopView.topAnchor.constraint(equalTo: self.tabbarVC.view.topAnchor).isActive = true
    self.tabbarVC.safeAreaTopView.leadingAnchor.constraint(equalTo: self.tabbarVC.view.leadingAnchor).isActive = true
    self.tabbarVC.safeAreaTopView.trailingAnchor.constraint(equalTo: self.tabbarVC.view.trailingAnchor).isActive = true
    self.tabbarVC.safeAreaTopView.bottomAnchor.constraint(equalTo: self.tabbarVC.navBarView.topAnchor).isActive = true
    self.tabbarVC.safeAreaTopView.setup()
  }
  private func navigationBarView(){
    self.tabbarVC.navBarView.translatesAutoresizingMaskIntoConstraints = false
    self.tabbarVC.navBarView.trailingAnchor.constraint(equalTo: self.tabbarVC.view.trailingAnchor).isActive = true
    self.tabbarVC.navBarView.leadingAnchor.constraint(equalTo: self.tabbarVC.view.leadingAnchor).isActive = true
    self.tabbarVC.navBarView.topAnchor.constraint(equalTo: self.tabbarVC.view.safeAreaLayoutGuide.topAnchor).isActive = true
    self.tabbarVC.navBarView.heightAnchor.constraint(equalToConstant: 59).isActive = true
    self.tabbarVC.navBarView.setup()
  }
  private func addedAllView(){
    self.tabbarVC.view.addSubview(self.tabbarVC.navBarView)
    self.tabbarVC.tabBar.addSubview(self.tabbarVC.tabBarView)
    self.tabbarVC.view.addSubview(self.tabbarVC.safeAreaBottomView)
    self.tabbarVC.view.addSubview(self.tabbarVC.safeAreaTopView)
  }
}
//MARK: - Initial
extension SetupMainTabBar {
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.tabbarVC = viewController
  }
}


