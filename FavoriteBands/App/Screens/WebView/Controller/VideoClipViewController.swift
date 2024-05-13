//
//  VideoClipViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 13/05/24.
//

import UIKit

class VideoClipViewController: UIViewController {
    
    let videoClipView = VideoClipView()
    let viewModel: VideoClipViewModel
    
    init(firstSingle: FirstSingle) {
        self.viewModel = VideoClipViewModel(firstSingle: firstSingle)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = videoClipView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
    }
    
    private func setNavBar() {
        title = viewModel.firstSingle.name.uppercased()
        view.backgroundColor = .systemBackground
    }
}
