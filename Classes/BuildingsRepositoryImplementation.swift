//
//  BuildingsRepositoryImplementation.swift
//  CombineTest
//
//  Created by Julien Rollet on 26/11/2019.
//

import Foundation
import MapKit
import PromiseKit
import Combine
import Alamofire

private struct Constants {
    static let request = "https://download.data.grandlyon.com/wfs/grandlyon"
}

class BuildingsRepositoryImplementation: BuildingsRepository {

    func getBuildings(in region: MKCoordinateRegion) -> Promise<[Building]> {
        return Promise { resolver in
            getBuildings(
                in: region,
                success: { resolver.fulfill($0) },
                failure: { resolver.reject($0) }
            )
        }
    }

    func getBuildings(in region: MKCoordinateRegion) -> Future<[Building], Error> {
        return Future { promise in
            self.getBuildings(
                in: region,
                success: { promise(.success($0)) },
                failure: { promise(.failure($0)) }
            )
        }
    }

    // MARK: - Private

    private func getBuildings(in region: MKCoordinateRegion,
                              success: @escaping ([Building]) -> Void,
                              failure: @escaping (Error) -> Void) {
        let minLat = region.center.latitude - region.span.latitudeDelta / 2.0
        let minLon = region.center.longitude - region.span.longitudeDelta / 2.0
        let maxLat = region.center.latitude + region.span.latitudeDelta / 2.0
        let maxLon = region.center.longitude + region.span.longitudeDelta / 2.0
        let parameters = [
            "SERVICE": "WFS",
            "VERSION": "2.0.0",
            "request": "GetFeature",
            "typename": "cad_cadastre.cadbatiment",
            "outputFormat": "application/json; subtype=geojson",
            "SRSNAME": "EPSG:4171",
            "BBOX": "\(minLat),\(minLon),\(maxLat),\(maxLon)",
        ]
        request(Constants.request, parameters: parameters).responseJSON { response in
            if let error = response.error {
                failure(error)
                return
            }
            guard
                let jsonResponse = response.result.value as? [String: Any],
                let buildings = self.extractRestBuildings(from: jsonResponse) else {
                    success([])
                    return
            }
            success(buildings.buildings.map { $0.toEntity })
        }
    }

    private func extractRestBuildings(from jsonResponse: [String: Any]) -> RestBuildings? {
        return try? JSONDecoder().decode(RestBuildings.self, fromDictionary: jsonResponse)
    }
}

private extension JSONDecoder {

    typealias JSON = [String: Any]

    /// Decodes a top-level value of the given type from the given JSON representation.
    ///
    /// - parameter type: The type of the value to decode.
    /// - parameter dictionary: The json dictionary (as [String: Any]) to decode from.
    /// - returns: A value of the requested type.
    /// - throws: `DecodingError.dataCorrupted` if values requested from the payload are corrupted, or if the given data is not valid JSON.
    /// - throws: An error if any value throws an error during decoding.
    func decode<T>(_ type: T.Type, fromDictionary dictionary: JSON) throws -> T where T: Decodable {
        let data = try JSONSerialization.data(withJSONObject: dictionary)
        return try self.decode(type, from: data)
    }
}
