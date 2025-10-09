//
//  LibraryViewInput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

protocol LibraryViewInput: AnyObject {
    func reloadData()
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}

