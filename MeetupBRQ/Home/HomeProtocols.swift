//
//  HomeProtocols.swift
//  MeetupBRQ
//
//  Created by Douglas Cardoso on 13/02/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

// MARK: WireFrameProtocol

protocol HomeWireframeProtocol: AnyObject {

}

// MARK: PresenterProtocol

protocol HomePresenterProtocol: AnyObject {

    var interactor: HomeInteractorInputProtocol? { get set }

}

// MARK: InteractorProtocol

protocol HomeInteractorOutputProtocol: AnyObject {

    /** Interactor -> Presenter */
    func fetchCharacters(characters: [Characters])
    func onError(message: String)
}

protocol HomeInteractorInputProtocol: AnyObject {

    var presenter: HomeInteractorOutputProtocol? { get set }

    /** Presenter -> Interactor */
    func getCharacters()
}

// MARK: ViewProtocol

protocol HomeViewProtocol: AnyObject {

    var presenter: HomePresenterProtocol? { get set }

    /** Presenter -> ViewController */
}
