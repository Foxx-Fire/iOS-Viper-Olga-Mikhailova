//
//  SearchPresenter.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import Foundation

final class SearchPresenter: SearchViewOutput {
    weak var view: SearchViewInput?
    var interactor: SearchInteractorInput
    var router: SearchRouterInput
    
    init(
        view: SearchViewInput,
        interactor: SearchInteractorInput,
        router: SearchRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoading()
        interactor.loadData()
    }
}
