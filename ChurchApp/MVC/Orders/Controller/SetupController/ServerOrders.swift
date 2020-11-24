//
//  ServerOrders.swift
//  ChurchApp

import Foundation

class ServerOrders: Controller {
  
  //MARK: - Public variable
  public var VC: OrdersViewController!
  
  public func getOrders(completion: @escaping Clousure<[DECOrder]?>){
    //Request
    self.VC.server.request(requestType: .GETOrders) { [unowned self] (serverResult) in
      //Response
      switch serverResult {
        case .error(let error):
          guard let error = error else { return }
          print("Error server data: class: ServerOrders ->, function: getOrders -> data: [DECOrder] ->, description: ", error.localizedDescription)
          AlertEK.dеfault(title: .error, message: .noJSON){
            self.getOrders(completion: completion)
          }
        //Susses
        case .object(let object):
          let orders = object as? [DECOrder]
          completion(orders)
          print("Succesful data: class: ServerOrders ->, function: getOrders ->, data: [DECOrder]")
          
      }
    }
  }
}
//MARK: - Initial
extension ServerOrders{
  
  //MARK: - Inition
  convenience init(viewController: OrdersViewController) {
    self.init()
    self.VC = viewController
  }
}

