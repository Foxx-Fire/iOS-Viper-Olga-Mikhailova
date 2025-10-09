//
//  SearchSearchViewController.swift
//  MVP-Olga Mikhailova
//
//  Created by FoxxFire on 18.09.2025.
//
import UIKit

final class SearchViewController: BaseViewController, SearchViewInput {
    
    var output: SearchViewOutput?
    private let searchView = SearchView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigation()
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        view = searchView
    }
    
    private func setupNavigation() {
        configureNavigation(title: Constants.Navigation.title)
    }
    
    // MARK: - ForYouViewInput
    
    func reloadData() {
        // Будущее: обновление данных
        print("Search data reloaded")
    }
    
    func showLoading() {
        print("Search loading started")
    }
    
    func hideLoading() {
        print("Search loading finished")
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Constants

extension SearchViewController {
    enum Constants {
        enum Navigation {
            static let title = "Search"
        }
    }
}

