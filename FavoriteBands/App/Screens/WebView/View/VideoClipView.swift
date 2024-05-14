//
//  VideoClipView.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 12/05/24.
//

import UIKit
import WebKit

//class VideoClipView: UIView {
//    lazy var webView: WKWebView = {
//        let webView = WKWebView()
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        return webView
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        setupView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func configure(clip: FirstSingle) {
//        guard let url = URL(string: clip.videoClip) else { return }
//        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
//    }
//    
//    private func setupView() {
//        setHierarchy()
//        setConstraints()
//    }
//    
//    private func setHierarchy () {
//        addSubview(webView)
//    }
//    
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            webView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            webView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//}
