//
//  Weather.swift
//  Mobile Weather App
//
//  Created by Mahmoud on 17/09/2023.
//

import Foundation

//struct WeatherDetail: Codable{
//    var main: String
//    var description: String
//    var icon: String
//    init() {
//    
//    main = ""
//    description = ""
//    icon =  ""
//    }
//
//    }
struct Main: Codable {
    let temp,  tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    init() {
        temp = 0
        tempMax=0
        tempMin=0
    }
}
//struct weather: Codable {
//    let description: String
//    let iconName: String
//
//    enum CodingKeys: String, CodingKey {
//        case description
//        case iconName = "main"
//    }
//
//    init() {
//        description = ""
//        iconName = ""
//    }
//}

