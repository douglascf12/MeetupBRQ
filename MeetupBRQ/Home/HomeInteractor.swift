//
//  HomeInteractor.swift
//  MeetupBRQ
//
//  Created by Douglas Cardoso on 13/02/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    
    func fetchCharacters() {
        do {
            guard let filePath = Bundle.main.url(forResource: "characters", withExtension: "json") else {
                presenter?.onError(message: "Não foi possível encontrar o arquivo.")
                return
            }
            let jsonData = try Data(contentsOf: filePath)
            let jsonDecoder = JSONDecoder()
            let characters = try jsonDecoder.decode([Characters].self, from: jsonData)
            presenter?.loadCharacters(characters: characters)
        } catch(let errorMessage) {
            presenter?.onError(message: errorMessage.localizedDescription)
        }
    }
}
