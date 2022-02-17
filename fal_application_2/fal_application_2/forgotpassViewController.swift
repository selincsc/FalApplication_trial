//
//  forgotpassViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
class forgotpassViewController: MyController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func close_button_action(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var textfield_outlet: UITextField!
    @IBAction func send_button_action(_ sender: Any) {
        
        let parameters: Parameters = [
            "email" : textfield_outlet.text ?? "",
        ]
        
        let url = apiURL + "/sifremiUnuttum"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                let json = JSON(value)
                Swift.print(json);
                
                if json["isSuccess"].boolValue{
                    messageBox(title: json["desc"]["baslik"].stringValue, message: json["desc"]["mesaj"].stringValue,buttonTitle: json["desc"]["positive"].stringValue,isDismiss: true)
                }else{
                    messageBox(title: json["desc"]["baslik"].stringValue, message: json["desc"]["mesaj"].stringValue,buttonTitle: json["desc"]["positive"].stringValue)
                }
                
                
            case .failure(let error):
                Swift.print(error)
        }
        }
}
    }
    

