//
//  CarruselViewModel.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 18/12/23.
//

import Foundation

class CarruselViewModel{
  
  var coordinator : CarruselCoordinator!
  var detalleInfo : ModelSpaceX?
  
  func goToYouTube(){
    coordinator.goToYouTube()
  }
  func goToWebPage(){
    coordinator.goToWebPage()
  }
}
