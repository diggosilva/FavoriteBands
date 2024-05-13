//
//  DetailsBandViewController.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let detailsView = DetailsView()
    let viewModel: DetailsViewModel
    
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
        let cellType = viewModel.cellForRowAt(indexPath: indexPath)
        
        switch cellType {
        case .member(let member):
            guard let memberCell = tableView.dequeueReusableCell(withIdentifier: DetailsMemberCell.identifier, for: indexPath) as? DetailsMemberCell else { return UITableViewCell() }
            memberCell.configure(member: member)
            return memberCell
        case .album(let album):
            guard let albumCell = tableView.dequeueReusableCell(withIdentifier: DetailsAlbumCell.identifier, for: indexPath) as? DetailsAlbumCell else { return UITableViewCell() }
            albumCell.configure(album: album)
            return albumCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {
            let singleSelected = viewModel.band.albums[indexPath.row].firstSingle
            let videoClipVC = VideoClipViewController()
            videoClipVC.videoClipView.configure(clip: singleSelected)
            navigationController?.pushViewController(videoClipVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.tableView(titleForHeaderInSection: section)
    }
}
