//
//  DetailsMemberCell.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit
import SDWebImage

class DetailsMemberCell: UITableViewCell {
    static let identifier = "DetailsMemberCell"
    
    lazy var imageMember: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var labelInstrument: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelName, labelInstrument])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(member: Member) {
        guard let url = URL(string: member.image) else { return }
        imageMember.sd_setImage(with: url)
        labelName.text = member.name
        labelInstrument.text = member.instrument
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(imageMember)
        addSubview(hStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageMember.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageMember.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageMember.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageMember.widthAnchor.constraint(equalToConstant: 80),
            imageMember.heightAnchor.constraint(equalToConstant: 80),
            
            hStackView.centerYAnchor.constraint(equalTo: imageMember.centerYAnchor),
            hStackView.leadingAnchor.constraint(equalTo: imageMember.trailingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
}
