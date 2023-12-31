//
//  ContentView.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import SwiftUI
struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                SearchCityView(weatherViewModel: weatherViewModel)
           
                ScrollView(showsIndicators: false) {
                    FullWeatherView(weatherViewModel: weatherViewModel)
                        .padding(.top, 20 )
                }
            }
            .background(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
