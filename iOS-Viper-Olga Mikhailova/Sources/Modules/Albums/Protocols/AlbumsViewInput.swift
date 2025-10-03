//
//  AlbumsViewInput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//
import Foundation

//MARK: - View must implement

protocol AlbumsViewInput: AnyObject {
    var output: AlbumsViewOutput? { get set }
    func reloadData()
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}
