//
//  MedidasViewController.swift
//  CovidInforma
//
//  Created by Ross on 11/12/20.
//

import UIKit
import SwiftyGif

class MedidasViewController: UIViewController {

    @IBOutlet weak var gifImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
            // You can also set it with an URL pointing to your gif
            let url = URL(string: "https://media1.tenor.com/images/a866d1334a0a635eeda88c371caee50a/tenor.gif?itemid=16660839")
            self.gifImage.setGifFromURL(url!)
       
    }
    

}
