//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 02.10.2025.
//

import UIKit

final class ForYouModuleBuilder {
    static func build() -> UIViewController {
        let view = ForYouViewController()
        let interactor = ForYouInteractor()
        let router = ForYouRouter()
        let presenter = ForYouPresenter(
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
