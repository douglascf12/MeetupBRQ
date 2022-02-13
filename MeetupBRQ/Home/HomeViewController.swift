//
//  HomeViewController.swift
//  MeetupBRQ
//
//  Created by Douglas Cardoso on 13/02/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?
    var messageLabel: UILabel!
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorInset = .zero
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vila do Chaves"
        
        messageLabel = UILabel()
        messageLabel.text = "Ainda não há dado para ser exibido."
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        
        tableView.backgroundView = messageLabel
        
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension HomeViewController: HomeViewProtocol {
    // MARK: HomeViewProtocol functions
}
