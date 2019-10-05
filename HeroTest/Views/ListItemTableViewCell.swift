//
//  ListItemTableViewCell.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 05/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseIdentifier = "Item"
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "item_image"))
        imageView.contentMode = .center
        return imageView
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemImageView,
                                                       detailsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let brandNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    //MARK: - Init method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessibilityIdentifier = "ListItemTableViewCell"
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

//MARK: - Configure and Setup methods
extension ListItemTableViewCell {
    
    private func setupViews() {
        contentView.addSubview(containerStackView)
        let constraints: [NSLayoutConstraint] = [
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with item: Item) {
        idLabel.text = "ID: \(item.gtin14)"
        if let brandName = item.brandName {
            brandNameLabel.text = "Brand Name: \(brandName)"
            detailsStackView.addArrangedSubview(brandNameLabel)
        }
        if let name = item.name {
            nameLabel.text = "Name: \(name)"
            detailsStackView.addArrangedSubview(nameLabel)
        }
        if let size = item.size {
            sizeLabel.text = "Size: \(size)"
            detailsStackView.addArrangedSubview(sizeLabel)
        }
    }
}
