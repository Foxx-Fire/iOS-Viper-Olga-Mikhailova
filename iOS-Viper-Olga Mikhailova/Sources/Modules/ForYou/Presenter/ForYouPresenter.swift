//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 02.10.2025.
//

import Foundation

final class ForYouPresenter: ForYouViewOutput {
    weak var view: ForYouViewInput?
    var interactor: ForYouInteractorInput
    var router: ForYouRouterInput
    
    init(
        view: ForYouViewInput,
         interactor: ForYouInteractorInput,
         router: ForYouRouterInput
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

// MARK: - ForYouInteractorOutput
extension ForYouPresenter: ForYouInteractorOutput {
    func dataLoaded() {
        view?.hideLoading()
        view?.reloadData()
    }
    
    func dataLoadingFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
