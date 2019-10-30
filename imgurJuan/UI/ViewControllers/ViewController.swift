//
//  ViewController.swift
//  imgurJuan
//
//  Created by Juan sebastian Sanzone on 10/29/19.
//  Copyright © 2019 JS. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    internal lazy var rowHeight: CGFloat = 100
    internal let viewModel: ImgurViewModel = ImgurViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchItems("cats") // Define the query to search images.
    }
}

// MARK: Private methods.
private extension ViewController {
    func setupTableView() {
        let bottomContentInset: CGFloat = 44
        tableView.register(ItemRowTableViewCell.self, forCellReuseIdentifier: ItemRowTableViewCell.reuseIdentifier)
        tableView.register(UINib(nibName: ItemRowTableViewCell.xibName, bundle: nil), forCellReuseIdentifier: ItemRowTableViewCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: bottomContentInset, right: 0)
        tableView.reloadData()
    }

    func fetchItems(_ tagToSearch: String) {
        viewModel.fetchItems(success: { [weak self] _ in
            self?.tableView.reloadData()
        }, queryToSearch: tagToSearch)
    }
}
