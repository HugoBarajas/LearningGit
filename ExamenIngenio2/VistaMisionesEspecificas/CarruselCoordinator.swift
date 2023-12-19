//
//  CarruselCoordinator.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 18/12/23.
//

import Foundation
import UIKit


class CarruselCoordinator : Coordinator{
  var childCoordinator: [Coordinator] = []
  var navigationController : UINavigationController
  var detalleInfo: ModelSpaceX?
  
  init(navigationController : UINavigationController){
    self.navigationController = navigationController
  }
  
  
  func startCoordinator() {
    let view = EspecificMissionsViewController()
    let viewModel = CarruselViewModel()
    viewModel.detalleInfo = self.detalleInfo
    viewModel.coordinator = self
    view.viewModel = viewModel
    navigationController.setViewControllers([view], animated: true)
  }
  
  func goToYouTube(detalleInfo : ModelSpaceX){
    let coordinatorYouTube = YouTubeCoordinator(navigationController: navigationController)
    coordinatorYouTube.detalleInfo = detalleInfo
    childCoordinator.append(coordinatorYouTube)
    coordinatorYouTube.startCoordinator()
  }
  
  
  
  
}
