//
//  ViewController.swift
//  HomeworkBrowser
//
//  Created by Иван Знак on 24/12/2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, TargetViewDelegate, WKNavigationDelegate {
    let webView = WKWebView()
    let targetView = TargetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        targetView.delegate = self
        view.addSubview(webView)
        view.addSubview(targetView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            targetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
        let searchText = sender.searchField.text
        guard let searchURL = URL(string: "https://www.google.com/search?q=\(searchText!)&oq=\(searchText!)") else { return }
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: searchURL))
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Страница загружена успешно!")
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Ошибка загрузки: \(error.localizedDescription)")
    }
}

