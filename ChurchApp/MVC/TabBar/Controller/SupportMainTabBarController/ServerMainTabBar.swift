//
//  ServerMainTabBar.swift
//  ChurchApp
import Foundation

class ServerMainTabBar: Controller {
  
  //MARK: - Public variable
  public var VC: MainTabBarViewController!
  
  public func getWorships(completion: @escaping Clousure<[DECWorship]>){
    //Request
    self.VC.server.request(requestType: .GETWorships) { [weak self] (serverResult) in
      guard let self = self else { return }
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerMainTabBar ->, function: getServices -> data: [DECWorship] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getWorships(completion: completion)
        }
        //Susses
        case .object(let object):
          let worships  = object as! [DECWorship]
          completion(worships)
          print("Succesful data: class: ServerMainTabBar ->, function: getServices ->, data: [DECWorship]")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerMainTabBar{
  
  //MARK: - Inition
  convenience init(viewController: MainTabBarViewController) {
    self.init()
    self.VC = viewController
  }
}

