//
//  RestBuilding.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

struct RestBuildings: Decodable {
    let buildings: [RestBuilding]

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case buildings = "features"
    }
}

struct RestBuilding: Decodable {
    let properties: RestBuildingProperties

    var toEntity: Building {
        return Building(id: properties.gid, type: properties.type)
    }

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case properties = "properties"
    }
}

struct RestBuildingProperties: Decodable {
    let gid: Int
    let type: String

    // MARK: - Decodable

    enum CodingKeys: String, CodingKey {
        case gid = "gid"
        case type = "type"
    }
}
