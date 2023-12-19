//
//  AppCoordinator.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 18/12/23.
//

import Foundation
import UIKit


protocol Coordinator{
  var childCoordinator : [Coordinator] {get set}//get obtener su valor, set asignarle un valor
  func startCoordinator()
}

class AppCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var window : UIWindow
  
  init(window : UIWindow){
    self.window = window
  }
  
  func startCoordinator() {
let navigationController = UINavigationController()
    let collectionSpaceXCoordinator = CollectionSpaceXCoordinator(navigationController : navigationController )
    childCoordinator.append(collectionSpaceXCoordinator)
    collectionSpaceXCoordinator.startCoordinator()
    
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
  
}
