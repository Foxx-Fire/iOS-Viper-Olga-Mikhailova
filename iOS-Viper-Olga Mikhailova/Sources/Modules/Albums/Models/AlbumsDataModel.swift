//
//  CellItemProtocol.swift
//  MVP-Olga Mikhailova
//
//  Created by FoxxFire on 18.09.2025.
//
import Foundation

// MARK: - Базовый протокол для всех элементов ячеек
protocol CellItemProtocol {
    var cellIdentifier: String { get }
    var itemId: String { get }
    var itemTitle: String { get }
    var itemCountOrSubtitle: String { get }
    var itemImageName: String { get }
}

//  MARK: - Model

struct MyAlbum: CellItemProtocol{
    let imageName: String
    let title: String
    let count: Int
    var cellIdentifier: String { "MyAlbumsCell" }
    var itemId: String {"myAlbum_\(title)"}
    var itemTitle: String { title }
    var itemCountOrSubtitle: String { "\(count) photos" }
    var itemImageName: String { imageName }
}

struct FirstSharedAlbum: CellItemProtocol {
    let imageNames: [String]
    let title: String
    let subtitle: String
    var cellIdentifier: String { "SharedAlbumsFirstCell" }
    var itemId: String {"firstSharedAlbum_\(title)"}
    var itemTitle: String { title }
    var itemCountOrSubtitle: String { subtitle }
    var itemImageName: String { imageNames.first ?? "photo" }
}

struct SharedAlbum: CellItemProtocol {
    let imageName: String
    let title: String
    let subtitle: String
    var cellIdentifier: String { "SharedAlbumsCell" }
    var itemId: String {"sharedAlbum_\(title)"}
    var itemTitle: String { title }
    var itemCountOrSubtitle: String { subtitle }
    var itemImageName: String { imageName }
}

struct MediaAndOther: CellItemProtocol {
    let imageName: String
    let title: String
    let count: Int
    let chevronName: String
    var cellIdentifier: String { "MediaTypesCell" }
    var itemId: String {"mediaAndOther_\(title)"}
    var itemTitle: String { title }
    var itemCountOrSubtitle: String { "\(count)" }
    var itemImageName: String { imageName }
}

struct SectionHeader {
    let title: String
    let buttonTitle: String?
}


