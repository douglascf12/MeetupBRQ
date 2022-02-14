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
    
    func getCharacters() {
        do {
            guard let filePath = Bundle.main.url(forResource: "characters", withExtension: "json") else { return }
            let jsonData = try Data(contentsOf: filePath)
            let jsonDecoder = JSONDecoder()
            let characters = try jsonDecoder.decode([Characters].self, from: jsonData)
            // TODO: - Criar func de retorno com sucesso no HomeInteractorOutputProtocol
        } catch(let errorMessage) {
            // TODO: - Criar func de retorno com erro no HomeInteractorOutputProtocol
        }
    }
}
