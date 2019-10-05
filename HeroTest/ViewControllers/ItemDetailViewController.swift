//
//  ItemDetailViewController.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 05/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let viewModel: ItemDetailViewModel
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "item_image"))
        imageView.accessibilityIdentifier = "imageView"
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let displayText: UITextView = {
        let label = UITextView()
        label.accessibilityIdentifier = "textView"
        label.isEditable = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init Methods
    init(viewModel: ItemDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View Controller delegate methods
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        title = viewModel.item.name ?? "Item Detail"
        setupViews()
    }
}

// MARK: - View Setup
extension ItemDetailViewController {
    private func setupViews() {
        view.addSubview(itemImageView)
        view.addSubview(displayText)
        
        let constraints: [NSLayoutConstraint] = [
            itemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemImageView.widthAnchor.constraint(equalToConstant: 100),
            itemImageView.heightAnchor.constraint(equalToConstant: 100),
            
            displayText.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 20),
            displayText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            displayText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            displayText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        displayText.text = viewModel.displayText
    }
}
