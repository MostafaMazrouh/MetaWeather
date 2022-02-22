//
//  CitiesList.swift
//  MetaWeatherTests
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import XCTest
@testable import MetaWeather

class CitiesListTests: XCTestCase {

    var networkDataSourceMock: NetworkDataSourceInterface!
    
    override func setUpWithError() throws {
        networkDataSourceMock = NetworkDataSourceMock()
    }

    override func tearDownWithError() throws {
        networkDataSourceMock = nil
    }

    func testGetCityModelWithId() throws {
        
        let citiesListRepo: CitiesListRepoInterface = CitiesListRepo(dataSource: networkDataSourceMock, urlString: "")
        
        citiesListRepo.getCityModelWithId(woeid: 0) { result in
            switch result {
            case .success(let cityModel):
                XCTAssert(cityModel.title == "London", "Wrong title")
            case .failure(let networkError):
                XCTFail("failure: \(networkError)")
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
