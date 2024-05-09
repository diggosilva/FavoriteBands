//
//  DetailsBandViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    let viewModel = DetailsViewModel()
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegateAndDataSource()
    }
    
    private func setNavBar() {
        title = "DETALHES"
        view.backgroundColor = .systemBackground
    }
    
    private func setDelegateAndDataSource() {
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numbersOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRowsInSection(numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsMemberCell.identifier, for: indexPath) as? DetailsMemberCell else { return UITableViewCell() }
            
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsAlbumCell.identifier, for: indexPath) as? DetailsAlbumCell else { return UITableViewCell() }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
