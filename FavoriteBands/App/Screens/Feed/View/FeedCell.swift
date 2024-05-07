//
//  FeedCell.swift
//  FavoriteBands
//
//  Created by Diggo Silva on 07/05/24.
//

import UIKit
import SDWebImage

class FeedCell: UITableViewCell {
    static let identifier = "FeedCell"
    
    lazy var viewBG: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .lightGray
        image.layer.borderColor = UIColor.gray.cgColor
        image.layer.borderWidth = 1
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(feedBand: FeedBand) {
        guard let url = URL(string: feedBand.logo) else { return }
        imageLogo.sd_setImage(with: url)
        self.accessoryType = .disclosureIndicator
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        contentView.addSubview(viewBG)
        viewBG.addSubview(imageLogo)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            viewBG.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewBG.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewBG.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewBG.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageLogo.topAnchor.constraint(equalTo: viewBG.topAnchor, constant: 10),
            imageLogo.bottomAnchor.constraint(equalTo: viewBG.bottomAnchor, constant: -10),
            imageLogo.centerXAnchor.constraint(equalTo: viewBG.centerXAnchor),
            imageLogo.centerYAnchor.constraint(equalTo: viewBG.centerYAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
}
