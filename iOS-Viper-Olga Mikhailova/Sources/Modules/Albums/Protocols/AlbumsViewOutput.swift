//
//  AlbumsViewOutput.swift
//  iOS-Viper-Olga Mikhailova
//
//  Created by FoxxFire on 03.10.2025.
//

import Foundation

//MARK: - View may require from Presenter

protocol AlbumsViewOutput: AnyObject {
    func viewDidLoad()
    func didSelectItem(at indexPath: IndexPath)
    func didTapHeaderButton(in section: Int)
    func numberOfSections() -> Int
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> CellItemProtocol?
    func headerTitle(for section: Int) -> String?
    func headerButtonTitle(for section: Int) -> String?
    func layoutType(for section: Int) -> AlbumCompositionalLayout.LayoutType?
}
