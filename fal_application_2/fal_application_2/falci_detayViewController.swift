//
//  falci_detayViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
class falci_detayViewController: MyController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    @IBAction func back_button_action(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet weak var table_view_outlet: UITableView!{
        didSet{
            table_view_outlet.delegate = self
            table_view_outlet.dataSource = self
            table_view_outlet.rowHeight = 162     }
    }
    

}
extension falci_detayViewController{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getfalci_request_json(id: falcilar["data"][indexPath.item]["falci_id"].stringValue)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return falcilar["data"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_view_outlet.dequeueReusableCell(withIdentifier: "falcidetayTableViewCell",for: indexPath) as! falcidetayTableViewCell
        Url_To_Image(url: imageBaseURL + falcilar ["data"][indexPath.item]["falci_img"].stringValue, imageView: cell.image_view_outlet)
        cell.image_view_outlet.makeRounded()
        cell.name_label_outlet.text = falcilar["data"][indexPath.item]["falci_name"].stringValue
        cell.kredi_label_outlet.text = falcilar["data"][indexPath.item]["kredi"].stringValue
        if falcilar["data"][indexPath.item]["oneCikar"].boolValue == true{
            cell.onecikar_button_outlet.isHidden = false
        }else{
            cell.onecikar_button_outlet.isHidden = true

        }
       
    
    
        return cell
    }
    
}
extension falci_detayViewController{
    
    
    //ALAMOFIRE JSON
    func getfalci_request_json(id : String){
        let parameters : Parameters = [
            "falci_id":id ,
        ]
        
        let url = apiURL + "/getFalci"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                falci_detay = JSON(value)
                showVC(identifierName: "Hakk_ndaViewController")

            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
