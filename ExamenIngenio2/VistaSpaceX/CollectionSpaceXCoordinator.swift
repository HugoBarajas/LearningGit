//
//  CollectionSpaceXCoordinator.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 18/12/23.
//

import Foundation
import UIKit


class CollectionSpaceXCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var dataSource = [ModelSpaceX]()
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = CollectionSpaceXViewController()
    let viewModel = CollectionViewSpaceXViewModel()
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.pushViewController(view, animated: true)
  }
  
  func goToCarrusel(infoC : ModelSpaceX){

    let coordinatorCarrusel = CarruselCoordinator(navigationController: navigationController)
    coordinatorCarrusel.detalleInfo = infoC
    childCoordinator.append(coordinatorCarrusel)
    coordinatorCarrusel.startCoordinator()

  }
  
  
  
  
}


  
  
  
  
  

