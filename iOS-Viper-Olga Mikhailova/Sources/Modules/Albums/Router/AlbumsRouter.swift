//
//  AlbumsRouter.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 30.09.2025.
//

import UIKit

final class AlbumsRouter {
    
    // MARK: - VIPER Connections
    weak var viewController: UIViewController?
}

// MARK: - AlbumsRouterInput
extension AlbumsRouter: AlbumsRouterInput {
    
    func showAlbumDetail(_ album: CellItemProtocol) {
        // Здесь будет создание и показ экрана деталей альбома
        print("Navigating to album detail: \(album.itemId)")
    }
    
    func showError(_ error: any Error) {
        let alert = UIAlertController(
            title: "Ошибка",
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        viewController?.present(alert, animated: true)
    }
}
