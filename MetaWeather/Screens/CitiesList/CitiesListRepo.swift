//
//  CitiesListDataSource.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 19/02/2022.
//

import Foundation

protocol CitiesListRepoInterface {
    func getCityModelWithId(woeid: Int, completionHandler: @escaping (Result<CityModel, NetworkError>) -> Void)
}

class CitiesListRepo: CitiesListRepoInterface {
    
    private let dataSource: NetworkDataSourceInterface
    private let baseURL: String
    private let endpointCitiesList: String
    
    init(dataSource: NetworkDataSourceInterface = URLSession.shared, urlString: String = Constants.baseURL) {
        self.dataSource = dataSource
        self.baseURL = urlString
        endpointCitiesList = Constants.endpointCitiesList
    }
    
    func getCityModelWithId(woeid: Int, completionHandler: @escaping (Result<CityModel, NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(baseURL)\(endpointCitiesList)\(woeid)") else { return }
        
        dataSource.performRequest(for: url) { data, response, error in
            
            guard let data = data,
                  error == nil,
                  let citiesList = Coder().decode(toType: CityModel.self, from: data) else {
                      completionHandler(.failure(.badURL))
                      return
                  }
            completionHandler(.success(citiesList))
        }
    }
}
