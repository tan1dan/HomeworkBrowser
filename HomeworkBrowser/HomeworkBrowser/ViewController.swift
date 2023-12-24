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
    let startRequest = URLRequest(url: URL(string: "https://www.google.com")!)
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        targetView.delegate = self
        view.addSubview(webView)
        view.addSubview(targetView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        targetView.translatesAutoresizingMaskIntoConstraints = false
        DispatchQueue.main.async {
            self.webView.load(self.startRequest)
        }
        NSLayoutConstraint.activate([
            targetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            targetView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            targetView.bottomAnchor.constraint(equalTo: webView.topAnchor, constant: -10),
            targetView.heightAnchor.constraint(equalToConstant: 30),
            
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func buttonBackPressed(_ sender: TargetView) {
        if webView.canGoBack {
            webView.goBack()
        }
        
    }
    
    func buttonForwardPressed(_ sender: TargetView) {
        if webView.canGoForward {
            webView.goForward()
        }
        
    }
    
    func buttonRestartPressed(_ sender: TargetView) {
        webView.reload()
    }
    
    func buttonSearchPressed(_ sender: TargetView) {
        let searchText = sender.searchField.text
        guard let searchURL = URL(string: "https://www.google.com/search?q=\(searchText!)&oq=\(searchText!)") else { return }
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: searchURL))
        }
        targetView.searchField.text = ""
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Страница загружена успешно!")
        if !webView.canGoBack {
            targetView.buttonBack.isEnabled = false
        }
        else{
            targetView.buttonBack.isEnabled = true
        }
        if !webView.canGoForward{
            targetView.buttonForward.isEnabled = false
        }
        else {
            targetView.buttonForward.isEnabled = true
        }
        targetView.searchField.placeholder = "Search"
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Ошибка загрузки: \(error.localizedDescription)")
        if !webView.canGoBack {
            targetView.buttonBack.isEnabled = false
        }
        else{
            targetView.buttonBack.isEnabled = true
        }
        if !webView.canGoForward{
            targetView.buttonForward.isEnabled = false
        }
        else {
            targetView.buttonForward.isEnabled = true
        }
        targetView.searchField.placeholder = "Search"
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        targetView.buttonBack.isEnabled = false
        targetView.buttonForward.isEnabled = false
        targetView.searchField.placeholder = "Идет загрузка страницы"
    }
}

