//
//  DetailsBandViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit
import SafariServices

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    let viewModel: DetailsViewModelProtocol
    
    init(feedBand: FeedBand) {
        self.viewModel = DetailsViewModel(band: feedBand)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        title = viewModel.getNameBand().uppercased()
        view.backgroundColor = .systemBackground
    }
    
    private func setDelegateAndDataSource() {
        detailsView.tableView.delegate = self
        detailsView.tableView.dataSource = self
    }
    
    private func showFirstSingle(url: String) {
        guard let url = URL(string: url) else { return }
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url, configuration: config)
        present(vc, animated: true)
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
        let cellType = viewModel.cellTypeFor(indexPath: indexPath)
        
        let cell: UITableViewCell = switch cellType {
        case .member(let member):
            let memberCell = tableView.dequeueReusableCell(withIdentifier: DetailsMemberCell.identifier, for: indexPath) as! DetailsMemberCell
            memberCell.configure(member: member)
            memberCell
        case .album(let album):
            let albumCell = tableView.dequeueReusableCell(withIdentifier: DetailsAlbumCell.identifier, for: indexPath) as! DetailsAlbumCell
            albumCell.configure(album: album)
            albumCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellType = viewModel.cellTypeFor(indexPath: indexPath)
        
        if case .album(let album) = cellType {
            showFirstSingle(url: album.firstSingle.videoClip)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableView(titleForHeaderInSection: section)
    }
}
