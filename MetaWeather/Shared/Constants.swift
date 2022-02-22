//
//  Constants.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 20/02/2022.
//

import Foundation

class Constants {
    static let baseURL = "https://www.metaweather.com/"
    static let endpointCitiesList = "api/location/"
    static let endpointWeatherIcon = "static/img/weather/png/64/"
    static let errorMessage = "Something went wrong"
}

enum NetworkError: Error {
    case badURL
}
