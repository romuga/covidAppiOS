//
//  CovidManager.swift
//  CovidInforma
//
//  Created by Ross on 14/12/20.
//

import Foundation

protocol CovidManagerDelegate {
    func actualizarDatos(datos: CovidModelo)
    
    func error(cualError: Error)
}

struct CovidManager {
    var delegado: CovidManagerDelegate?
    
    //url de la api
    let covidURL = "https://corona.lmao.ninja/v3/covid-19/countries/"
    
    func fetchCovid(nombreCiudad: String){
        let urlString = "\(covidURL)\(nombreCiudad)"
        print(urlString)
        realizarSolicitud(urlString: urlString)
    }
    
    func realizarSolicitud (urlString: String){
        //crear la url
        if let url = URL(string: urlString){
            //crear la url sesion
            let session = URLSession(configuration: .default)
            //asignar una tarea a la sesion
            let tarea = session.dataTask(with: url) { (data,respuesta,error) in
                
                if error != nil{
                    delegado?.error(cualError: error!)
                    print(error!)
                    return
                }
                
                if let datosSeguros = data {
                    //let dataString = String(data: datosSeguros, encoding: .utf8)
                    //print(dataString!)
                    //self.parseJSON(climaData: datosSeguros)
                    if let covidDatos = self.parseJSON(covidDatos: datosSeguros){
                        //quien sea el delegado, cualquier clase o strcut que implemente
                        //el metodo actualizar clima
                        
                        delegado?.actualizarDatos(datos: covidDatos)
                    }
                    
                }
            }
            
            //empezar la tarea
            tarea.resume()
        }
    }
    
    func parseJSON(covidDatos: Data) -> CovidModelo?{
        let decoder = JSONDecoder()
        
        do{
            let dataDecodificada = try decoder.decode(CovidData.self, from: covidDatos)
            let ciudad = dataDecodificada.country
            let bandera = dataDecodificada.countryInfo.flag
            let casos = dataDecodificada.todayCases
            let muertes = dataDecodificada.todayDeaths
            let recuperados = dataDecodificada.todayRecovered
            
            let objCovid = CovidModelo(nombreCiudad: ciudad, bandera: bandera, casos: casos, muertes: muertes, recuperados: recuperados)
            
            return objCovid
            
        }catch{
            delegado?.error(cualError: error)
            //print(error)
            return nil
        }
    }
}
