//
//  NetworkManager.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import Foundation

protocol NetworkManagerDelegate{
  func responseSuccess(response : [ModelSpaceX])
  func responseError(error : Error)
}

class NetworkManager : NSObject, URLSessionDelegate, URLSessionDataDelegate{
  
  var delegate : NetworkManagerDelegate?
  
  func getSpaceXList(){
    
    let urlString = "https://api.spacexdata.com/v3/launches/past"
    let url = URL(string: urlString)!
    
    let sessionConfiguration = URLSessionConfiguration.default
    let defaultSession = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: OperationQueue.main)
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.timeoutInterval = 60
    
    let task = defaultSession.dataTask(with: request){[self]data, response, error in
      if let error = error{
        delegate?.responseError(error : error)
      }else{
        if let data = data{
          do{
            let ModelSpaceXObject = try JSONDecoder().decode([ModelSpaceX].self, from: data)
            
            print("Este es el objeto\(ModelSpaceXObject)")
            delegate?.responseSuccess(response: ModelSpaceXObject)
            
          }catch{
            print(error.localizedDescription)
            delegate?.responseError(error: error)
          }
        }
      }
    }
    task.resume()
  }
  
}
