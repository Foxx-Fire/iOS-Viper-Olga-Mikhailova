//
//  AlbumsInteractor.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 30.09.2025.
//
import Foundation

final class AlbumsInteractor {
    
    // MARK: - VIPER Connections
    weak var output: AlbumsInteractorOutput?
    
    // MARK: - Services
    private let dataService: AlbumsDataServiceProtocol
    
    // MARK: - Data
    private var sections: [AlbumSection] = []
    
    init(dataService: AlbumsDataServiceProtocol) {
        self.dataService = dataService
    }
}

// MARK: - AlbumsInteractorInput
extension AlbumsInteractor: AlbumsInteractorInput {
    
    func fetchAlbums() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let sectionsData = self.dataService.getAllSections()
            self.sections = sectionsData
            self.output?.albumsFetched(sectionsData)
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
}
