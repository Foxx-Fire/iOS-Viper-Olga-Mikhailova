//
//  ForYouViewController.swift
//  MVP-Olga Mikhailova
//
//  Created by FoxxFire on 18.09.2025.
//
import UIKit

final class ForYouViewController: BaseViewController, ForYouViewInput {
    
    var output: ForYouViewOutput?
    
    private let forYouView = ForYouView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigation()
        output?.viewDidLoad()
    }
    
    // MARK: - Setup Methods
    
    private func setupView() {
        view = forYouView
    }
    
    func setupNavigation() {
        configureNavigation(title: Constants.Navigation.title)
    }
    
    // MARK: - ForYouViewInput
    
    func reloadData() {
        // Будущее: обновление данных
        print("ForYou data reloaded")
    }
    
    func showLoading() {
        print("ForYou loading started")
    }
    
    func hideLoading() {
        print("ForYou loading finished")
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Constants

extension ForYouViewController {
    enum Constants {
        enum Navigation {
            static let title = "For You"
        }
    }
}

