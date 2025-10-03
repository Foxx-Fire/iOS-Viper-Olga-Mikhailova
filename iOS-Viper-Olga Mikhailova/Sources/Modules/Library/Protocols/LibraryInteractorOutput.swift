//
//  LibraryInteractorOutput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

protocol LibraryInteractorOutput: AnyObject {
    func dataLoaded()
    func dataLoadingFailed(_ error: Error)
}
