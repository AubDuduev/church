//
//  GETDonations.swift
import Foundation

class GETDonations: Requestoble {
  
  private var urls       = URLs()
  private var parameters = URLParameters()
  private var headers    = URLHeaders()
  private var jsonDecode = JSONDecode()
  private var urlBody    = URLBody()
  
  public func type(data: Any?, completion: @escaping ClousureRequest) {
    
    let url     = self.urls.create(type: .start(.start))?.URL
    let header  = self.headers.create(type: .autorization_appJson)
    
    //Request
    self.jsonDecode.decode(jsonType: DECStart.self, url: url, header: header, httpMethod: .get) { (decodeResult) in
      //Responce
      switch decodeResult {
        //Error
        case .error(let error):
          completion(.error(error))
        //Susses
        case .json(let object):
          if let services = object as? DECStart {
            if let donations = services.donations {
              completion(.object(donations))
            }
        }
      }
    }
  }
}
