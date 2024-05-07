//
//  DetailsBandView.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsView: UIView {
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .secondarySystemFill
        table.register(DetailsMemberCell.self, forCellReuseIdentifier: DetailsMemberCell.identifier)
        table.register(DetailsAlbumCell.self, forCellReuseIdentifier: DetailsAlbumCell.identifier)
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(tableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
