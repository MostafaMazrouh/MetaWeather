//
//  NetworkDataSourceMock.swift
//  MetaWeatherTests
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import XCTest
@testable import MetaWeather

class NetworkDataSourceMock: NetworkDataSourceInterface {
    typealias Handler = NetworkDataSourceInterface.Handler
    
    var requestedURL: URL?
    
    func performRequest(for url: URL, completionHandler: @escaping Handler) {
        requestedURL = url
        
        let bundel = Bundle(for: Coder.self)
        
        if let path = bundel.path(forResource: "CityModel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                completionHandler(data, nil, nil)
            } catch {
                XCTFail("Can't read CityModel.json")
            }
        } else {
            XCTFail("Can't get path to CityModel.json")
        }
    }
}
