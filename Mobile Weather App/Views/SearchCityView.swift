//
//  SearchCityView.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import SwiftUI

struct SearchCityView: View {
    @ObservedObject var weatherViewModel: WeatherViewModel
    @State private var startCity = Constants.Strings.city
    
    var body: some View {
        HStack {
            TextField("", text: $startCity)
                .padding(.leading, 50)
                .font(.system(size: 30))
            Button {
                weatherViewModel.city = startCity
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.blue.opacity(0.4))
                        .frame(width: 60, height: 60)
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(.ultraThinMaterial
                     ,in: RoundedRectangle(cornerRadius: 20))
    }
}

struct SearchCityView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
