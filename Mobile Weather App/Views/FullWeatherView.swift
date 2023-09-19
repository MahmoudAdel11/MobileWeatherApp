//
//  FullWeatherView.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import SwiftUI

struct FullWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
       
        VStack {
            
            CurrentlyWeatherView(weatherViewModel: weatherViewModel)
                
        }
    }
}

struct FullWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        FullWeatherView(weatherViewModel: WeatherViewModel())
    }
}
