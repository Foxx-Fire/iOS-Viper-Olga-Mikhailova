//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 02.10.2025.
//

import Foundation

final class ForYouInteractor: ForYouInteractorInput {
    weak var output: ForYouInteractorOutput?
    
    func loadData() {
        // Пока просто имитируем загрузку
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.output?.dataLoaded()
        }
    }
}
