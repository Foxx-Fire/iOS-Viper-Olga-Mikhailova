//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//
import Foundation

final class LibraryPresenter: LibraryViewOutput {
    weak var view: LibraryViewInput?
    var interactor: LibraryInteractorInput
    var router: LibraryRouterInput
    
    init(
        view: LibraryViewInput,
        interactor: LibraryInteractorInput,
        router: LibraryRouterInput
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
extension LibraryPresenter: LibraryInteractorOutput {
    func dataLoaded() {
        view?.hideLoading()
        view?.reloadData()
    }
    
    func dataLoadingFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}

