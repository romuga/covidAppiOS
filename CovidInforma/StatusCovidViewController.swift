//
//  StatusCovidViewController.swift
//  CovidInforma
//
//  Created by Ross on 11/12/20.
//

import UIKit

class StatusCovidViewController: UIViewController {

    func error(cualError: Error) {
        print(cualError.localizedDescription)
        DispatchQueue.main.async {
            //self.ciudadLabel.text = "Verifica tu escritura"
        }
    }
    func actualizarDatos(datos: CovidModelo){
        DispatchQueue.main.async {
            self.namePaisLabel.text = datos.nombreCiudad
            self.imagePais.image = UIImage(named: datos.bandera)
            self.casosLabel.text = datos.casosText
            self.muertesLabel.text = datos.muertesText
            self.recuperadosLabel.text = datos.recuperadosText
        }
    }
    var covidManager = CovidManager()
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

    }
    

}
