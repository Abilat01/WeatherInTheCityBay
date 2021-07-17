    //
//  ViewController.swift
//  WeatherInTheCity
//
//  Created by Danya on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        self.searchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
    }
    
}

