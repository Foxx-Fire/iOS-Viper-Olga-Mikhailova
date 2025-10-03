//
//  AlbumsPresenter.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 30.09.2025.
//
import Foundation

final class AlbumsPresenter {
    
    // MARK: - VIPER Connections
    weak var view: AlbumsViewInput?
    var interactor: AlbumsInteractorInput
    var router: AlbumsRouterInput
    
    // MARK: - Data
    private var sections: [AlbumSection] = []
    
    init(
        interactor: AlbumsInteractorInput,
        router: AlbumsRouterInput,
        view: AlbumsViewInput
    ) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
}

extension AlbumsPresenter: AlbumsViewOutput {
    func viewDidLoad() {
        view?.showLoading()
        interactor.fetchAlbums()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let item = item(at: indexPath) else { return }
        print("Selected item: \(item.itemId)")
        router.showAlbumDetail(item)
    }
    
    func didTapHeaderButton(in section: Int) {
        guard section < sections.count else { return }
        
        switch sections[section].type {
        case .myAlbums:
            print("See All tapped for My Albums")
        case .sharedAlbums:
            print("See All tapped for Shared Albums")
        case .mediaTypes, .other:
            print("Button tapped for section: \(sections[section].type.rawValue)")
        }
    }
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard section < sections.count else { return 0 }
        return sections[section].items.count
    }
    
    func item(at indexPath: IndexPath) -> (any CellItemProtocol)? {
        guard indexPath.section < sections.count,
              indexPath.item < sections[indexPath.section].items.count else {
            return nil
        }
        return sections[indexPath.section].items[indexPath.item]
    }
    
    func headerTitle(for section: Int) -> String? {
        guard section < sections.count else { return nil }
        return sections[section].header.title
    }
    
    func headerButtonTitle(for section: Int) -> String? {
        guard section < sections.count else { return nil }
        return sections[section].header.buttonTitle
    }
    
    func layoutType(for section: Int) -> AlbumCompositionalLayout.LayoutType? {
        guard section < sections.count else { return nil }
        
        switch sections[section].type {
        case .myAlbums: return .columns
        case .sharedAlbums: return .plain
        case .mediaTypes, .other: return .tableStyle
        }
    }
}

extension AlbumsPresenter: AlbumsInteractorOutput {
    func albumsFetched(_ sections: [AlbumSection]) {
        self.sections = sections
        view?.hideLoading()
        view?.reloadData()
    }
    
    func albumsFetchFailed(_ error: any Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
