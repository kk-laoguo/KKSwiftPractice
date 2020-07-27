//
//  SelectCityController.swift
//  Weather
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit

protocol SelectCityDelegate {
    func didSelectCity(city: String)
}

class SelectCityController: UIViewController {

    
    var currentCity = ""
    var deleagte: SelectCityDelegate?
    
    @IBOutlet weak var cityInput: UITextField!
    
    
    @IBOutlet weak var currentCityLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        currentCityLab.text = currentCity
    }
    
    @IBAction func changeCity(_ sender: UIButton) {
        deleagte?.didSelectCity(city: cityInput.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
