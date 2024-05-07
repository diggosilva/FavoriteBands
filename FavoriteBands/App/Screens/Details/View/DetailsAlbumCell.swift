//
//  DetailsAlbumCell.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsAlbumCell: UITableViewCell {
    static let identifier = "DetailsAlbumCell"
    
    lazy var imageAlbum: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house.fill")
        image.backgroundColor = .systemYellow
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Álbum Aqui"
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var labelYear: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Year: 1982"
        label.textAlignment = .right
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy var labelSingle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Single: Primeiro Clipe"
        label.textAlignment = .right
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelTitle, labelYear, labelSingle])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(imageAlbum)
        addSubview(hStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageAlbum.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageAlbum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageAlbum.widthAnchor.constraint(equalToConstant: 80),
            imageAlbum.heightAnchor.constraint(equalTo: imageAlbum.widthAnchor),
            
            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            hStackView.leadingAnchor.constraint(equalTo: imageAlbum.trailingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
}
