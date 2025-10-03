//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import UIKit

final class LibraryModuleBuilder {
    static func build() -> UIViewController {
        let view = LibraryViewController()
        let interactor = LibraryInteractor()
        let router = LibraryRouter()
        let presenter = LibraryPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        
        // Связываем VIPER
        view.output = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
