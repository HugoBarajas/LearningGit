//
//  WebPageViewController.swift
//  ExamenIngenio2
//
//  Created by Angel Olvera on 11/12/23.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController, WKNavigationDelegate {
    
    var spaceXInfo: ModelSpaceX?
    var viewModel : WebViewModel!
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        guard let urlString = spaceXInfo?.links?.wikipedia,
              let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        view.addSubview(webView)
        webView.addAnchorsWithMargin(0)
    }
}
