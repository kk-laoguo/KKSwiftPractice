//
//  ViewController.swift
//  Weather
//
//  Created by zainguo on 2019/5/21.
//  Copyright © 2019 zainguo. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let appid = "e72ca729af228beabd5d20e3b7749713"
    let weather = Weather()
    
    
    
    @IBOutlet weak var cityLab: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // 请求授权获取当前位置
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // 设置精度
        locationManager.requestLocation() // 请求用户信息, 只请求一次
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCity" {
            let vc = segue.destination as! SelectCityController
            vc.currentCity = self.weather.city
            vc.deleagte = self
            
            
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        let paras = ["lat": "\(lat)", "lon": "\(lon)", "appid": appid]
        getWeather(paras: paras)
      
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
        cityLab.text = "获取位置失败"
    }


}


extension ViewController {
    func getWeather(paras: [String: String]) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather", parameters: paras).responseJSON { (response) in
            if let json = response.result.value {
                let weather = JSON(json)
                self.createWeather(weatherJSON: weather)
                self.updateUI()
            }
            
        }
    }
    func createWeather(weatherJSON: JSON) {
        weather.city = weatherJSON["name"].stringValue
        weather.temp = Int(round(weatherJSON["main", "temp"].doubleValue))
        weather.condition = weatherJSON["weather", 0 , "id"].intValue
    }
    func updateUI() {
        cityLab.text = self.weather.city
        tempLabel.text = "\(self.weather.temp)"
        imageView.image = UIImage(named: self.weather.icon)
    }
    
}


extension ViewController: SelectCityDelegate {
    func didSelectCity(city: String) {
        let paras = ["q":city,"appid":appid]
        getWeather(paras: paras)

    }

}
