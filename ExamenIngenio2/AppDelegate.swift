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

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    
    //window donde se guardan todos los view controller
    window = UIWindow(frame: UIScreen.main.bounds)
    let navigationController = UINavigationController(rootViewController: CollectionSpaceXViewController())//cual va a ser el controller principal, o el inicial
    window?.rootViewController = navigationController// el navigatorController va a ser la raiz de nuestra ventana.
    window?.makeKeyAndVisible()//que se haga visible la ventana

    
    return true
  }

 

}
