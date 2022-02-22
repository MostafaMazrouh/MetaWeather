//
//  CitiesListCell.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 19/02/2022.
//

import UIKit
import SDWebImage

class CitiesListCell: UITableViewCell {
    
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var temperatureImage: UIImageView!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var bgImage: UIImageView!
    
    static let cellId = "CitiesListCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImage.layer.cornerRadius = 8
    }
    
    func configure(cityModel: CityModel) {
        cityNameLabel.text = cityModel.title
        if (cityModel.consolidated_weather?.count ?? 0) > 0 {
            let weather = cityModel.consolidated_weather?[0]
            temperatureLabel.text = "\(Int(weather?.the_temp ?? 0)) °C"
            
            stateLabel.text = weather?.weather_state_name ?? ""
            
            let abbr = weather?.weather_state_abbr ?? ""
            let weatherIconURL = "\(Constants.baseURL)\(Constants.endpointWeatherIcon)\(abbr).png"
            temperatureImage.sd_setImage(with: URL(string: weatherIconURL), completed: nil)
        }
    }
}
