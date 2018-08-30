//
//  ViewController.swift
//  WebBrowser
//
//  Created by Jaeho Lee on 29/08/2018.
//  Copyright © 2018 Jay Lee. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

    @IBOutlet weak var containerView: UIView!
    var webView: WKWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var fieldURL: UITextField!
    
    override func loadView() {
        super.loadView()
        
        webView = WKWebView(frame: containerView.bounds)
        webView.navigationDelegate = self
        
        containerView.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "http://www.google.co.kr")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    @IBAction func goBackClicked(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goForwardClicked(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func stopClicked(_ sender: Any) {
        webView.stopLoading()
    }
    
    @IBAction func refreshClicked(_ sender: Any) {
        webView.reload()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = .white
        textField.textColor = .black
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let fieldURL = URL(string: "http://" + textField.text!)
        let request = URLRequest(url: fieldURL!)
        webView.load(request)
        textField.endEditing(true)
        textField.backgroundColor = .clear
        textField.textColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        return true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        fieldURL.endEditing(true)
        fieldURL.backgroundColor = .clear
        fieldURL.textColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
        fieldURL.text = webView.url?.absoluteString
    }
}

