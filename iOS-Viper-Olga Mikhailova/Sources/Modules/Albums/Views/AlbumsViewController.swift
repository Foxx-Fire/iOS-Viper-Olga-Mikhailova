//
//  Untitled.swift
//  iOS-MVVM-Olga Mikhailova
//
//  Created by FoxxFire on 26.09.2025.
//

import UIKit

final class AlbumsViewController: BaseViewController, AlbumsViewInput {

    // MARK: - VIPER Properties
    
    var output: AlbumsViewOutput?
    
    // MARK: - UI Elements
    
    private lazy var albumsView: AlbumsView = {
        let view = AlbumsView { [weak self] sectionIndex in
            self?.output?.layoutType(for: sectionIndex)
        }
        view.setupDataSource(dataSource: self)
        view.setupDelegate(delegate: self)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = albumsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        output?.viewDidLoad() // ← Сообщаем Presenter что View загрузилась
    }
    
    // MARK: - Private Methods
    
    private func setupNavigation() {
        let addAction = UIAction { _ in
            print("Add button tapped in Albums")
        }
        
        configureNavigation(
            title: Constants.Navigation.title,
            showButton: true,
            buttonImage: Constants.Navigation.buttonImageName,
            buttonAction: addAction
        )
    }
    
    // MARK: - AlbumsViewInput
    
    func reloadData() {
        albumsView.reloadData()
    }
    
    func showLoading() {
        // Показываем индикатор загрузки
        print("Loading started...")
    }
    
    func hideLoading() {
        // Скрываем индикатор загрузки
        print("Loading finished!")
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - Constants
extension AlbumsViewController {
    enum Constants {
        enum Navigation {
            static let title = "Albums"
            static let buttonImageName = "plus"
        }
    }
}

// MARK: - UICollectionViewDelegate

extension AlbumsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Снимаем выделение с анимацией
        collectionView.deselectItem(at: indexPath, animated: true)
        output?.didSelectItem(at: indexPath) // ← Сообщаем Presenter о тапе
    }
}

// MARK: - UICollectionViewDataSource

extension AlbumsViewController: UICollectionViewDataSource {
    
    // Определяет количество секций в коллекции
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return output?.numberOfSections() ?? 0
    }
    
    // Определяет количество ячеек в конкретной секции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return output?.numberOfItems(in: section) ?? 0
    }
    
    // Создает и настраивает ячейку для конкретной позиции
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let item = output?.item(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: item.cellIdentifier,
            for: indexPath
        )
        
        configureCell(cell: cell, cellItem: item)
        return cell
    }
    
    private func configureCell(
        cell: UICollectionViewCell,
        cellItem: CellItemProtocol
    ) {
        switch cellItem.cellIdentifier {
        case MyAlbumsCell.identifier:
            guard let cell = cell as? MyAlbumsCell,
                  let myAlbum = cellItem as? MyAlbum else { return }
            
            cell.configuration(model: myAlbum)
            
        case SharedAlbumsFirstCell.identifier:
            guard let cell = cell as? SharedAlbumsFirstCell,
                  let firstShared = cellItem as? FirstSharedAlbum else { return }
            
            cell.configuration(model: firstShared)
            
        case SharedAlbumsCell.identifier:
            guard let cell = cell as? SharedAlbumsCell,
                  let shared = cellItem as? SharedAlbum else { return }
            
            cell.configuration(model: shared)
            
        case MediaTypesCell.identifier:
            guard let cell = cell as? MediaTypesCell,
                  let media = cellItem as? MediaAndOther else { return }
            
            cell.configuration(model: media)
            
        case OtherAlbumsCell.identifier:
            guard let cell = cell as? OtherAlbumsCell,
                  let media = cellItem as? MediaAndOther else { return }
            
            cell.configuration(model: media)
        default:
            break
        }
    }
    
    //MARK: - настройки хэдера
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: AlbumsHeaderView.identifier,
            for: indexPath
        ) as? AlbumsHeaderView else {
            return UICollectionReusableView()
        }
        
        header.configure(
            title: output?.headerTitle(for: indexPath.section) ?? "",
            buttonTitle: output?.headerButtonTitle(for: indexPath.section),
            buttonAction: { [weak self] in
                self?.output?.didTapHeaderButton(in: indexPath.section)
            }
        )
        
        return header
    }
}






