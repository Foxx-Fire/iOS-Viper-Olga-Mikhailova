//
//  LibraryViewController.swift
//  MVP-Olga Mikhailova
//
//  Created by FoxxFire on 18.09.2025.
//
import UIKit

final class LibraryViewController: BaseViewController, LibraryViewInput {
    
    var output: LibraryViewOutput?
    
    private let libraryView = LibraryView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigation()
    }
    
    // MARK: - Setups
    
    private func setupView() {
        view = libraryView
    }
    
    func setupNavigation() {
        configureNavigation(title: Constants.Navigation.title)
    }
    
    // MARK: - ForYouViewInput
    
    func reloadData() {
        // Будущее: обновление данных
        print("Library data reloaded")
    }
    
    func showLoading() {
        print("Library loading started")
    }
    
    func hideLoading() {
        print("Library loading finished")
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Constants

extension LibraryViewController {
    enum Constants {
        enum Navigation {
            static let title = "Library"
        }
    }
}

