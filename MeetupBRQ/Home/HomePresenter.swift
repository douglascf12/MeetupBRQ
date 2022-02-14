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
    
    private var characters = [Characters]()
    private var messageError = String()

    init(interface: HomeViewProtocol, interactor: HomeInteractorInputProtocol?, router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func fetchCharacters() {
        view?.showLoading()
        interactor?.fetchCharacters()
    }
    
    func numberOfRows() -> Int {
        return characters.count
    }
    
    func getCharacterForCell(at indexPath: IndexPath) -> Characters {
        return characters[indexPath.row]
    }
    
    func setMessageError() -> String {
        return messageError
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func loadCharacters(characters: [Characters]) {
        self.characters = characters
        view?.showCharacters()
    }
    
    func onError(message: String) {
        self.messageError = message
        view?.showError()
    }
}
