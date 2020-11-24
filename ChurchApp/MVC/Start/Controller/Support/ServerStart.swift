//
//  ServerStart.swift
//  ChurchApp

import Foundation

class ServerStart: Controller {
  
  //MARK: - Public variable
  public var VC: StartViewController!
  
  public func getStartScreen(completion: @escaping Clousure<[DECStartScreen]>){
    //Request
    self.VC.server.request(requestType: .GETStartScreen) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerLoading ->, function: getStartScreen -> data: [DECStartScreen] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getStartScreen(completion: completion)
        }
        //Susses
        case .object(let object):
          let startScreens  = object as! [DECStartScreen]
          completion(startScreens)
          print("Succesful data: class: ServerLoading ->, function: getStartScreen ->, data: [DECStartScreen]")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerStart{
  
  //MARK: - Inition
  convenience init(viewController: StartViewController) {
    self.init()
    self.VC = viewController
  }
}

