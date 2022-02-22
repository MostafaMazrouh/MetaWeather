//
//  CoderTests.swift
//  MetaWeatherTests
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import XCTest
@testable import MetaWeather

class CoderTests: XCTestCase {

    var coder: Coder!
    var bundel: Bundle!
    
    override func setUp() {
        coder = Coder()
        bundel = Bundle(for: Coder.self)
    }

    override func tearDown() {
        coder = nil
        bundel = nil
    }
    
    func testDacode()
    {
        if let path = bundel.path(forResource: "CityModel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let cityModel = coder.decode(toType: CityModel.self, from: data)
                
                XCTAssert(cityModel?.title == "London", "Wrong title")
                XCTAssert(cityModel?.woeid == 44418, "Wrong woeid")
            }
            catch {
                XCTFail("Can't read CityModel.json")
            }
        } else {
            XCTFail("Can't get path to CityModel.json")
        }
        
    }
}
