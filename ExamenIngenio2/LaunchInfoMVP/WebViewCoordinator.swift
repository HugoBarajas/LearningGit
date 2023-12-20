//
//  WebViewCoordinator.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 18/12/23.
//

import Foundation
import UIKit

class WebViewCoordinator : Coordinator{
    var childCoordinator: [Coordinator] = []
    var navigationController : UINavigationController
    var detalleInfo : ModelSpaceX?
    
    init(navigationController : UINavigationController){
        self.navigationController = navigationController
    }
        func startCoordinator() {
          let view = WebPageViewController()
          let viewModel = WebViewModel()
          viewModel.detalleInfo = self.detalleInfo
          viewModel.coordinator = self
          view.viewModel = viewModel
          navigationController.setViewControllers([view], animated: true)
        }
}
