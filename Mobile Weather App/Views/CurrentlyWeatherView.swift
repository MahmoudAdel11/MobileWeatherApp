//
//  CurrentlyWeatherView.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import SwiftUI

struct CurrentlyWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
//        VStack(spacing:5) {
//
//            HStack(spacing: 10) {
//                VStack(alignment: .center) {
//                    Text("\(weatherViewModel.temperature)°C")
//                        .font(.system(size: 45))
//
//                    Text("\(weatherViewModel.Maxtemperature)°C")
//                        .font(.system(size: 45))
//                    Text("\(weatherViewModel.Mintemperature)°C")
//                        .font(.system(size: 45))
//                    Text("\(weatherViewModel.TheCityName)°C")
//                        .font(.system(size: 45))
//                }
//            }
//        }
//        .padding()
//        .foregroundStyle(.white)
//        .background(.ultraThinMaterial
//                     ,in: RoundedRectangle(cornerRadius: 15))
        
        VStack{
            VStack{
                Image("Weatnerimage").resizable().frame(width: 200, height: 200, alignment: .center).cornerRadius(20)
            }
            Spacer()
            Text(weatherViewModel.TheCityName
            ).font(Font.system(size: 32))
            Text("\(weatherViewModel.temperature)ºc").font(Font.system(size: 100)).fontWeight(.thin)
            HStack{
                Text("H:\(weatherViewModel.Maxtemperature)ºc L:\(weatherViewModel.Mintemperature)ºc ").font(Font.system(size: 18)).fontWeight(.medium)
//            Text(" ").font(Font.system(size: 18))
            Image(systemName: "cloud.fill" )
            }
            //                .fontWeight(.medium)
           
            //                .fontWeight(.medium)
            
        }
            .background(.ultraThinMaterial
                    ,in: RoundedRectangle(cornerRadius: 15))
        .foregroundColor(.white)
    }
}
struct CurrentlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentlyWeatherView(weatherViewModel: WeatherViewModel())
    }
}
