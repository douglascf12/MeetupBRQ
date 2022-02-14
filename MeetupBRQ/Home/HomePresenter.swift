//
//  HomePresenter.swift
//  MeetupBRQ
//
//  Created by Douglas Cardoso on 13/02/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomePresenter: HomePresenterProtocol {

    weak private var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    private let router: HomeWireframeProtocol

    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func fetchCharacters() {
        interactor?.fetchCharacters()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func loadCharacters(characters: [Characters]) {
        view?.showCharacters(characters: characters)
    }
    
    func onError(message: String) {
        view?.showError(message: message)
    }
}
