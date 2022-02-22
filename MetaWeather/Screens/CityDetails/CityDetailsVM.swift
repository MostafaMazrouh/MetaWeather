//
//  CityDetailsVM.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import Foundation

class CityDetailsVM: ObservableObject {
    @Published var cityModel: CityModel
    
    init(cityModel: CityModel) {
        self.cityModel = cityModel
    }
}
