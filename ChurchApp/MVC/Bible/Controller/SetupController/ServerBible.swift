//
//  ServerBible.swift
//  ChurchApp

import Foundation

class ServerBible: Controller {
  
  //MARK: - Public variable
  public var VC: BibleViewController!
  
  
}
//MARK: - Private functions
extension ServerBible {
  
  public func getBible(completion: @escaping Clousure<[DECBible]?>){
    //Request
    self.VC.server.request(requestType: .GETBible) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerBible ->, function: getBible -> data: [DECBible]? ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getBible(completion: completion)
          }
        //Susses
        case .object(let object):
          let bible = object as? [DECBible]
          completion(bible)
          print("Succesful data: class: ServerBible ->, function: getBible ->, data: [DECBible]?")
          
      }
    }
  }
}
//MARK: - Initial
extension ServerBible{
  
  //MARK: - Inition
  convenience init(viewController: BibleViewController) {
    self.init()
    self.VC = viewController
  }
}

