//
//  NetworkDataSource.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import Foundation

protocol NetworkDataSourceInterface {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    func performRequest(for url: URL, completionHandler: @escaping Handler)
}

extension URLSession: NetworkDataSourceInterface {
    typealias Handler = NetworkDataSourceInterface.Handler
    
    func performRequest(for url: URL, completionHandler: @escaping Handler) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
}
