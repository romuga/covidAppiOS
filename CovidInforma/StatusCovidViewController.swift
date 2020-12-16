//
//  StatusCovidViewController.swift
//  CovidInforma
//
//  Created by Ross on 11/12/20.
//

import UIKit

class StatusCovidViewController: UIViewController, UISearchBarDelegate, CovidManagerDelegate {

    func error(cualError: Error) {
        print(cualError.localizedDescription)
        DispatchQueue.main.async {
            let alertVacio = UIAlertController(title: "Alerta", message: "Ingresa un país válido", preferredStyle: .alert)
            let actionVacio = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertVacio.addAction(actionVacio)
            self.present(alertVacio, animated: true, completion: nil  )
        }
    }
    func actualizarDatos(datos: CovidModelo){
        DispatchQueue.main.async {
            let url = URL(string: datos.bandera)
            let data = try? Data(contentsOf: url!)
            self.namePaisLabel.text = datos.nombreCiudad
           self.imagePais.image = UIImage(data: data!)
            self.casosLabel.text = datos.casosText
            self.muertesLabel.text = datos.muertesText
            self.recuperadosLabel.text = datos.recuperadosText
        }
    }
    var covidManager = CovidManager()
    var searchController: UISearchController?
    @IBOutlet weak var imagePais: UIImageView!
    @IBOutlet weak var namePaisLabel: UILabel!
    @IBOutlet weak var casosLabel: UILabel!
    @IBOutlet weak var muertesLabel: UILabel!
    @IBOutlet weak var searchPais: UISearchBar!
    @IBOutlet weak var recuperadosLabel: UILabel!
    @IBOutlet weak var imageCasos: UIImageView!
    @IBOutlet weak var imageMuertes: UIImageView!
    @IBOutlet weak var imageRecuperados: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        covidManager.fetchCovid(nombreCiudad: "Mexico")
        covidManager.delegado = self
        
        searchPais.delegate = self
        

    }
    private func searchBarTextDidEndEditing(_ searchBar: UISearchBar) -> Bool {
        if searchPais.text != ""{
            return true
        }else{
            searchPais.placeholder = "Buscar ciudad"
            return false
        }
    }
    @IBAction func buscarPais(_ sender: UIButton) {
        covidManager.fetchCovid(nombreCiudad: searchPais.text!)
    }
    

}
