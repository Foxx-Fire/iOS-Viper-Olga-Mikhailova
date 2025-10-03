//
//  Untitled.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//
import Foundation

protocol ForYouInteractorOutput: AnyObject {
    func dataLoaded()
    func dataLoadingFailed(_ error: Error)
}
