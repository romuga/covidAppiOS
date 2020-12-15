//
//  CovidModelo.swift
//  CovidInforma
//
//  Created by Ross on 14/12/20.
//

import Foundation

struct CovidModelo {
    let nombreCiudad: String
    let bandera: String
    let casos: Int
    let muertes: Int
    let recuperados: Int
    
    var casosText: String{
        return String(casos)
    }
    var muertesText: String{
        return String(muertes)
    }
    var recuperadosText: String{
        return String(recuperados)
    }
}

