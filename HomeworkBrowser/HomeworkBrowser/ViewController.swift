//
//  ViewController.swift
//  HomeworkBrowser
//
//  Created by Иван Знак on 24/12/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, TargetViewDelegate {
    let webView = WKWebView()
    let targetView = TargetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        view.addSubview(targetView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            targetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            targetView.bottomAnchor.constraint(equalTo: webView.topAnchor, constant: -5),
            targetView.heightAnchor.constraint(equalToConstant: 30),
            
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    func buttonBackPressed(_ sender: TargetView) {
        
    }
    
    func buttonForwardPressed(_ sender: TargetView) {
        
    }
    
    func buttonRestartPressed(_ sender: TargetView) {
        
    }
    
    func buttonSearchPressed(_ sender: TargetView) {
        
    }
    
}

