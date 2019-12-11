//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextfield: UITextField!
    private let hello = "d"
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextfield.delegate = self
    }

    @IBAction func searchText(_ sender: UIButton) {
        print(searchTextfield.text!)
        
    }
    
}

extension WeatherViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(hello)
       return true
    }
}
