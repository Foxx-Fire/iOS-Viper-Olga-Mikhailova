//
//  AlbumsRouterInput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//
import Foundation

//MARK: - Presenter may require form Router
protocol AlbumsRouterInput {
    func showAlbumDetail(_ album: CellItemProtocol)
    func showError(_ error: Error)
}

