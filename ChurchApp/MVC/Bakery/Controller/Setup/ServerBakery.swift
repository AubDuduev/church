//
//  ServerBakery.swift
//  ChurchApp

import Foundation

class ServerBakery: Controller {
  
  //MARK: - Public variable
  public var VC: BakeryViewController!
  
  public func getProducts(completion: @escaping Clousure<[DECProduct]>){
    //Request
    self.VC.server.request(requestType: .GETProducts) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerBakery ->, function: getProducts -> data: [DECProduct] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getProducts(completion: completion)
        }
        //Susses
        case .object(let object):
          let products = object as! [DECProduct]
          completion(products)
          print("Succesful data: class: ServerBakery ->, function: getProducts ->, data: [DECProduct]")
      }
    }
  }
}
//MARK: - Initial
extension ServerBakery{
  
  //MARK: - Inition
  convenience init(viewController: BakeryViewController) {
    self.init()
    self.VC = viewController
  }
}

