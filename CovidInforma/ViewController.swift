//
//  ViewController.swift
//  CovidInforma
//
//  Created by Ross on 08/12/20.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var fuente: UILabel!
    @IBOutlet weak var mensajeCovidLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mensajeCovidLabel.text = "Los coronavirus son una familia de virus que causan enfermedades (desde el resfriado común hasta enfermedades respiratorias más graves) y circulan entre humanos y animales. En este caso, se trata del SARS-COV2. Apareció en China en diciembre pasado y provoca una enfermedad llamada COVID-19, que se extendió por el mundo y fue declarada pandemia global por la Organización Mundial de la Salud."
        fuente.text = "¿Qué es el coronavirus?.(n.d) Fecha de consulta: 13 de diciembre 2020 Disponible en: https://coronavirus.gob.mx/covid-19/ "
        
    }

    @IBAction func stopTyping(_ sender: UIButton) {
        mensajeCovidLabel.pauseTyping()
    }
    
    @IBAction func stopTyping2(_ sender: UIButton) {
        mensajeCovidLabel.pauseTyping()
    }
    @IBAction func stopTyping3(_ sender: UIButton) {
        mensajeCovidLabel.pauseTyping()
    }
}

