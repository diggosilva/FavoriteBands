//
//  ViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    lazy var labelTest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carregando..."
        label.textColor = .red
        return label
    }()
    
    let viewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(labelTest)
        
        NSLayoutConstraint.activate([
            labelTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTest.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        handleStates()
        viewModel.loadData()
    }
    
    func handleStates() {
        viewModel.state.bind { states in
            switch states {
            case .loading:
                return self.showLoadingState()
            case .loaded:
                return self.showLoadedState()
            case .error:
                return self.showErrorState()
            }
        }
    }
    
    func showLoadingState() {
        
    }
    
    func showLoadedState() {
        labelTest.text = viewModel.newLabel
        labelTest.textColor = .systemGreen
        view.backgroundColor = .systemBackground
    }
    
    func showErrorState() {
        
    }
}
