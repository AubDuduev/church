//
//  ServerWorship.swift
//  ChurchApp

import Foundation

class ServerWorship: Controller {
  
  //MARK: - Public variable
  public var VC: WorshipViewController!
  
  public func getWorships(completion: @escaping Clousure<[DECWorship]>){
    //Request
    self.VC.server.request(requestType: .GETWorships) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerServices ->, function: getServices -> data: [DECService] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getWorships(completion: completion)
        }
        //Susses
        case .object(let object):
          let worships  = object as! [DECWorship]
          completion(worships)
          print("Succesful data: class: ServerServices ->, function: getServices ->, data: [DECService]")
        
      }
    }
  }
}
//MARK: - Initial
extension ServerWorship{
  
  //MARK: - Inition
  convenience init(viewController: WorshipViewController) {
    self.init()
    self.VC = viewController
  }
}

