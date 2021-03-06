
//CoronaModel.swift
//Corona Widget

//Created by Aaryan Kothari on 22/07/20.


import WidgetKit
import SwiftUI
import Intents


struct Corona : Codable {
    let Global : Global
    let Countries : [Countries]
}

struct Global : Codable {
    let NewConfirmed  : Double
    let TotalConfirmed  : Double
    let NewDeaths  : Double
    let TotalDeaths  : Double
    let NewRecovered  : Double
    let TotalRecovered  : Double
}

struct Countries : Codable{
    let Country : String
    let CountryCode : String
    let Slug : String
    let NewConfirmed : Double
    let TotalConfirmed : Double
    let NewDeaths : Double
    let TotalDeaths : Double
    let NewRecovered : Double
    let TotalRecovered : Double
    let Date : String
    
    func totalActive() -> Double {
        return TotalConfirmed - TotalDeaths - TotalRecovered
    }
    
    func emoji() -> String {
        return convertToEmoji(str: CountryCode)
    }
}


struct CoronaData : TimelineEntry {
    var date =  Date()
    let Global : Global
    let Countries : [Countries]
    
    init(_ data : Corona){
        self.Global = data.Global
        self.Countries = data.Countries
    }
}
