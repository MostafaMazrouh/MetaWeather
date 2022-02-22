//
//  CitiesListVMTests.swift
//  MetaWeatherTests
//
//  Created by Mostafa Mahmoud on 22/02/2022.
//

import XCTest
@testable import MetaWeather

class CitiesListVMTests: XCTestCase {

    var citiesListRepoMock: CitiesListRepoInterface!
    
    
    override func setUpWithError() throws {
        citiesListRepoMock = CitiesListRepoMock(dataSource: NetworkDataSourceMock(), urlString: "")
    }

    override func tearDownWithError() throws {
        citiesListRepoMock = nil
    }

    func testgetSingleCity() throws {
        let citiesListVM = CitiesListVM(citiesListRepo: citiesListRepoMock)
        
        citiesListVM.getSingleCity(woeid: 0)
        
        guard let cityModels = citiesListVM.cityModels.value,
              cityModels.count == 1
        else {
            XCTFail("Empty Result")
            return
        }
        XCTAssert(cityModels[0].title == "London", "Wrong title")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
