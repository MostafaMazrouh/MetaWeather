//
//  CitiesListVM.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 19/02/2022.
//

import Foundation

class CitiesListVM {
    
    var citiesListRepo: CitiesListRepoInterface
    var cityModels = Binder([CityModel]())
    
    var citiesName = ["Gothenburg", "Stockholm", "Mountain View",
                      "London", "New York", "Berlin"]
    
    var citiesDictionary = [
        "Gothenburg":    890869,
        "Stockholm":     906057,
        "Mountain View": 2455920,
        "London":        44418,
        "New York":      2459115,
        "Berlin":        638242
    ]
    
    init(citiesListRepo: CitiesListRepoInterface = CitiesListRepo()) {
        self.citiesListRepo = citiesListRepo
    }
    
    func getCitiesList() {
        for (_, woeidValue) in citiesDictionary {
            self.getSingleCity(woeid: woeidValue)
        }
    }
    
    func getSingleCity(woeid: Int) {
        citiesListRepo.getCityModelWithId(woeid: woeid) { [weak self] result in
            switch result {
            case .success(let cityModel):
                self?.cityModels.value?.append(cityModel)
                
            case .failure(let networkError):
                print("Error: \(networkError)")
            }
        }
    }
}
