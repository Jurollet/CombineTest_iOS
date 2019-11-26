//
//  Coordinator.swift
//  CombineTest
//
//  Created by Pierre Felgines on 05/09/16.
//
//

import Foundation

// Base class for all coordinators.
// Each coordinator keeps an array of children coordinators (to avoid children being deallocated)

class Coordinator {
    var children: [Coordinator] = []

    deinit {
        guard children.isEmpty else {
            DDLogInfo("Children are not deallocated\n\(debugDescription())")
            return
        }
    }
}

extension Coordinator: Equatable {
    static func == (lhs: Coordinator, rhs: Coordinator) -> Bool {
        return lhs === rhs
    }
}

// This extension add handy methods to manipulate children array

extension Coordinator {

    func addChild(_ coordinator: Coordinator) {
        children.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator) {
        if let index = children.firstIndex(of: coordinator) {
            children.remove(at: index)
        }
    }

    func removeAllChildren() {
        children.removeAll(keepingCapacity: false)
    }
}

// MARK: - Debug

extension Coordinator {

    func debugDescription() -> String {
        return treeDescription()
    }

    // MARK: - Private

    private func treeDescription(indent: Int = 0) -> String {
        let prefix = (0..<indent)
            .map { _ in " " }
            .joined(separator: "")
        let childrenDescription = children
            .map { child in
                child.treeDescription(indent: indent + 4)
            }
            .joined(separator: "")
        return "\n"
            + prefix
            + String(describing: type(of: self))
            + childrenDescription
    }
}
