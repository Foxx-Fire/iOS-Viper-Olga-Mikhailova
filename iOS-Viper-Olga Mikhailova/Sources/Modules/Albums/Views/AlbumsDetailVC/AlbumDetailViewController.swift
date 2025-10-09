//
//  AlbumDetailViewController.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 09.10.2025.
//

import UIKit

final class AlbumDetailViewController: UIViewController {
    
    // MARK: - Properties
    private let album: CellItemProtocol
    
    // MARK: - Init
    init(album: CellItemProtocol) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Elements
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGray6
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        configureWithAlbum()
    }
    
    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .white
        title = "Album Details"
    }
    
    private func setupHierarchy() {
        view.addSubview(albumImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        
            albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            albumImageView.widthAnchor.constraint(equalToConstant: 200),
            albumImageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureWithAlbum() {
        albumImageView.image = UIImage(named: album.itemImageName) ?? UIImage(systemName: "photo")
        titleLabel.text = album.itemTitle
        subtitleLabel.text = album.itemCountOrSubtitle
    }
}
