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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension HomeViewController: HomeViewProtocol {
    // MARK: HomeViewProtocol functions
}
