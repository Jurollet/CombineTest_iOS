//
//  RestBuilding.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation

struct RestBuilding {
    let gid: Int
    let type: String

    var toEntity: Building {
        return Building(id: gid, type: type)
    }
}
