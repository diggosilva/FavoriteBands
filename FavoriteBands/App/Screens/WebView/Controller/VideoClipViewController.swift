//
//  VideoClipViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 13/05/24.
//

import UIKit

class VideoClipViewController: UIViewController {
    
    let videoClipView = VideoClipView()
    
    override func loadView() {
        super.loadView()
        view = videoClipView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        
    }
    
    private func setNavBar() {
        title = "VIDEOS"
        view.backgroundColor = .systemBackground
    }
    
}
