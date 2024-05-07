//
//  DetailsMemberCell.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit

class DetailsMemberCell: UITableViewCell {
    static let identifier = "DetailsMemberCell"
    
    lazy var imageMember: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
        image.backgroundColor = .lightGray
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Integrante"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
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
        addSubview(imageMember)
        addSubview(labelName)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageMember.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageMember.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageMember.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageMember.widthAnchor.constraint(equalToConstant: 80),
            imageMember.heightAnchor.constraint(equalToConstant: 80),
            
            
        ])
    }
}
