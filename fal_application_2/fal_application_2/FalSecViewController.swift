//
//  FalSecViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
class FalSecViewController: MyController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func kahve_button_action(_ sender: Any) {
        postrequest_json(fal_id: "1")
    }
   
    @IBAction func tarot_button_action(_ sender: Any) {
        postrequest_json(fal_id: "2")

    }
    
    @IBAction func melek_button_action(_ sender: Any) {
        postrequest_json(fal_id: "3")

    }
    
    
    @IBAction func katina_button_action(_ sender: Any) {
        postrequest_json(fal_id: "4")

    }
    
}
extension FalSecViewController{
    //ALAMOFIRE JSON
    func postrequest_json(fal_id : String){
        let parameters : Parameters = [
            "fal_id" : fal_id ,
            "search":"",
            "start":"0",
            "end":"30"
        ]
        
        let url = apiURL + "/getFalciList"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                falcilar = JSON(value)
                showVC(identifierName: "falci_detayViewController")

            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
