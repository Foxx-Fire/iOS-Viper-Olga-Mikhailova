//
//  SearchInteractor\.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import Foundation

final class SearchInteractor: SearchInteractorInput {
    weak var output: SearchInteractorOutput?
    
    func loadData() {
        // Пока просто имитируем загрузку
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.output?.dataLoaded()
        }
    }
}
