//
//  SearchViewInput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

protocol SearchViewInput: AnyObject {
    func reloadData()
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}
