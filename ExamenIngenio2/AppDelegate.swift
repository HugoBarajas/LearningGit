//
//  AppDelegate.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?
  var appCoordinator : AppCoordinator?
  

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    //window donde se guardan todos los view controller
    window = UIWindow(frame: UIScreen.main.bounds)
    appCoordinator = AppCoordinator(window: window!)
    appCoordinator?.startCoordinator()
    return true
  }

 

}
