//
//  ItemsListViewController.swift
//  HeroTest
//
//  Created by Bryan, Dominic (D.) on 04/10/2019.
//  Copyright © 2019 Bryan, Dominic (D.). All rights reserved.
//

import UIKit

class ItemsListViewController: UITableViewController {
    
    // MARK: - Properties
    weak var navigationDelegate: ItemNavigationDelegate?
    
    let itemsService = DataKickService()
    
    lazy var sortButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem(title: "Sort by Name",
                                        style: .plain,
                                        target: self,
                                        action: #selector(sortTable))
        barButton.accessibilityIdentifier = "sortButton"
        return barButton
    }()
    
    private let viewModel: ItemsListViewModelable
    
    // MARK: - Init Methods
    init(viewModel: ItemsListViewModelable) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    // MARK: - View Controller delegate methods
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.accessibilityIdentifier = "itemListTableView"
        tableView.register(ListItemTableViewCell.self, forCellReuseIdentifier: ListItemTableViewCell.reuseIdentifier)
        title = "Items"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        navigationItem.rightBarButtonItem = sortButton

        render(.loading)
        viewModel.fetchItems { [weak self] state in
            self?.render(state)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

// MARK: - State update
extension ItemsListViewController {
    
    private func render(_ state: ItemsTableViewState) {
        switch state {
        case .loading:
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        case .loaded:
            self.tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        case .failed:
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

// MARK: - Table view data source methods
extension ItemsListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let items = viewModel.items,
            let cell = tableView.dequeueReusableCell(withIdentifier: ListItemTableViewCell.reuseIdentifier, for: indexPath) as? ListItemTableViewCell else {
                return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

//MARK: - Table view delegate methods
extension ItemsListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let items = viewModel.items else { return }
        let item = items[indexPath.row]
        navigationDelegate?.detailView(with: item)
    }
}

// MARK: - Sort table methods
extension ItemsListViewController {
    @objc private func sortTable() {
        viewModel.sortItems()
        tableView.reloadData()
    }
}
