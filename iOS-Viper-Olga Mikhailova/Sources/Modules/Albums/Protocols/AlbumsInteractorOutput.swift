//
//  AlbumsInteractorOutput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import Foundation

//MARK: - Iteractor must notify Presenter
protocol AlbumsInteractorOutput: AnyObject {
    func albumsFetched(_ sections: [AlbumSection])
    func albumsFetchFailed(_ error: Error)
}
