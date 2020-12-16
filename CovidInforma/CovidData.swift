//
//  CovidData.swift
//  CovidInforma
//
//  Created by Ross on 14/12/20.
//

import Foundation

struct CovidData: Codable {
    let country: String
    let countryInfo: CountryInfo
    let todayCases: Int
    let todayDeaths: Int
    let todayRecovered: Int
}

struct CountryInfo : Codable{
    let flag: String
}
