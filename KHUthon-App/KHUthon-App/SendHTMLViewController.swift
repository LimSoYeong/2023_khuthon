//
//  SendHTMLViewController.swift
//  KHUthon-App
//
//  Created by 민 on 11/11/23.
//

import UIKit
import WebKit
import SnapKit
import Then

class SendHTMLViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    // private var webView = WKWebView()
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: self.view.frame)
        webView.allowsBackForwardNavigationGestures = true
        webView.uiDelegate = self
        webView.navigationDelegate = self
        return webView
    }()
    private let presentPopUPButton = UIButton().then {
        $0.setTitle("새로운 링크 추가하기", for: .normal)
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(red: 153.0 / 255.0, green: 50.0 / 255.0, blue: 42.0 / 255.0, alpha: 1.0)
        $0.addTarget(self, action: #selector(presentToPopUp), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        view.addSubViews(webView, presentPopUPButton)
        
        // view.addSubViews(webView, presentPopUPButton)
        
        
        webView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(103)
        }
        presentPopUPButton.snp.makeConstraints { make in
            make.width.equalTo(277)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(43)
        }
        // loadHTMLpage()
        loadWeb()
    }
    
    // MARK: - Action Properties
    @objc private func presentToPopUp(_ sender: UIButton) {
        let popupVC = PopUpViewController()
        popupVC.modalPresentationStyle = .overFullScreen
        self.present(popupVC, animated: false)
    }
    
    func loadWeb() {
        // self.view.addSubview(webView)
        
        guard let url = URL(string: "http://13.125.208.115:5000/") else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)
    }
    
    /// HTML 페이지를 로드합니다.
    //    func loadHTMLpage() {
    //        webView.uiDelegate = self
    //        webView.navigationDelegate = self
    //
    //        // 파일이름 ex) blog.html
    //        let resourceString = "test"
    //        guard let url = Bundle.main.url(forResource: resourceString,
    //                                        withExtension: "html")
    //        else {
    //            print("guard문에 걸려버렸어요.")
    //            return
    //        }
    //
    //        // 1. 왼쪽
    //        webView.load(URLRequest(url: URL(string: "{ notion url }")!))
    //        // 2. 가운데
    //        webView.loadFileURL(url, allowingReadAccessTo: url)
    //        // 3. 오른쪽
    //        webView.loadHTMLString(htmlStringText, baseURL: nil)
    //
    //    }
    
}
