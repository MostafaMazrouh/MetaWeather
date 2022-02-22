//
//  CityDetailsView.swift
//  MetaWeather
//
//  Created by Mostafa Mahmoud on 21/02/2022.
//

import SwiftUI

struct CityDetailsView: View {
    
    @ObservedObject public var cityDetailsVM: CityDetailsVM
    
    var body: some View {
        VStack{
            Spacer()
            
            Text(cityDetailsVM.cityModel.title ?? "")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack{
                Text("Max: ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("\(Int(cityDetailsVM.cityModel.consolidated_weather?[0].max_temp ?? 0)) °C")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            HStack{
                Text("Min: ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("\(Int(cityDetailsVM.cityModel.consolidated_weather?[0].min_temp ?? 0)) °C")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            HStack{
                Text("Now: ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                Text("\(Int(cityDetailsVM.cityModel.consolidated_weather?[0].the_temp ?? 0)) °C")
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
    }
}

//struct CityDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityDetailsView()
//    }
//}
