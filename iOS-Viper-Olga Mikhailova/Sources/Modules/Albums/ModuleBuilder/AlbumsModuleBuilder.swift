//
//  CreateAlbumsAssembly.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 30.09.2025.
//

import UIKit

final class AlbumsModuleBuilder {
    
    static func build() -> UIViewController {
        let view = AlbumsViewController()
        let interactor = AlbumsInteractor(
            dataService: AlbumsDataService()
        )
        let router = AlbumsRouter()
        let presenter = AlbumsPresenter(
            interactor: interactor,
            router: router,
            view: view
        )
        
        view.output = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
