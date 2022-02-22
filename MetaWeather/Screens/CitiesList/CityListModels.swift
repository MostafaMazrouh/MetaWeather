//
//  CityListModels.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 20/02/2022.
//

import Foundation

struct CityModel: Codable {
    let consolidated_weather: [WeatherModel]?
    
    let time: String?
    let sun_rise: String?
    let sun_set: String?
    let timezone_name: String?
    let title: String?
    let location_type: String?
    let woeid: Int?
}

struct WeatherModel: Codable {
    let id: Int?
    let weather_state_name: String?
    let weather_state_abbr: String?
    let wind_direction_compass: String?
    let created: String?
    let applicable_date: String?
    let min_temp: Double?
    let max_temp: Double?
    let the_temp: Double?
    let wind_speed: Double?
    let wind_direction: Double?
    let air_pressure: Double?
    let humidity: Double?
    let visibility: Double?
    let predictability: Double?
}
