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
    private var characters = [Characters]()
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorInset = .zero
        
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Vila do Chaves"
        
        presenter?.getCharacters()
        
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
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        cell.textLabel?.text = characters[indexPath.row].name
        return cell
    }
}

extension HomeViewController: HomeViewProtocol {
    func showCharacters(characters: [Characters]) {
        self.characters = characters
    }
    
    func showError(message: String) {
        self.messageLabel.isHidden = false
        self.messageLabel.text = message
    }
}
