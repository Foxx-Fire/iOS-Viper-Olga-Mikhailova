//
//  AlbumsInteractorInput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import Foundation

//MARK: - Presenter may require from Interactor
protocol AlbumsInteractorInput {
    func fetchAlbums()
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> CellItemProtocol?
}
