//
//  ViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: MyController {

    @IBOutlet weak var email_textfield_outlet: UITextField!
    @IBOutlet weak var password_tf_outlet: UITextField!
    @IBOutlet weak var label_outlet: UILabel!{
        didSet{
            label_outlet.text = "Üye değil misin? Kayıt ol"
        }
    }
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func eye_button_action(_ sender: Any) {
        password_tf_outlet.isSecureTextEntry.toggle()
           }
    @IBAction func sifremiunuttum_button_action(_ sender: Any) {
        showVC(identifierName: "forgotpassViewController")
    }
    @IBAction func login_button_action(_ sender: Any) {
        posts_request_json(email: email_textfield_outlet.text!, sifre: password_tf_outlet.text!)
    }
   
}
extension ViewController{
    //ALAMOFIRE JSON
    func posts_request_json(email: String, sifre: String){
        let parameters : Parameters = [
            "email": email,
            "pass": sifre
        ]
        let url = apiURL + "/giris"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                giris = JSON(value)
                if giris["isSuccess"].boolValue == true {
                    showVC(identifierName:"FalSecViewController")

                }else{
                       messageBox(title: giris["desc"]["baslik"].stringValue, message: giris["desc"]["mesaj"].stringValue)
                }
            
                
            case .failure(let error):
                Swift.print(error)
        }
        }
}
}
