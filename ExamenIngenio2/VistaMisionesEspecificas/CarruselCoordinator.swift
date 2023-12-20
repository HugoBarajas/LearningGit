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
    navigationController.pushViewController(view, animated: true)
  }
  
  func goToYouTube(){
    let coordinatorYouTube = YouTubeCoordinator(navigationController: navigationController)
    coordinatorYouTube.detalleInfo = self.detalleInfo
    childCoordinator.append(coordinatorYouTube)
    coordinatorYouTube.startCoordinator()
  }
    
    func goToWebPage(detalleInfo : ModelSpaceX){
      let coordinatorWeb = WebViewCoordinator(navigationController: navigationController)
        coordinatorWeb.detalleInfo = detalleInfo
      childCoordinator.append(coordinatorWeb)
        coordinatorWeb.startCoordinator()
    }
  
  func goToWebPage(){
    let coordinatorWebPage = WebViewCoordinator(navigationController: navigationController)
    coordinatorWebPage.detalleInfo = self.detalleInfo
    childCoordinator.append(coordinatorWebPage)
    coordinatorWebPage.startCoordinator()
  }
  
  
  
  
}
