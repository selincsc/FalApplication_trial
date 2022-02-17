//
//  yorumlarViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON
class yorumlarViewController: MyController, UIdelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back_button_action(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var comment_label_outlet: UILabel!
    @IBOutlet weak var date_label_outlet: UILabel!
    @IBOutlet weak var table_view_outlet: UITableView!{
        didSet{
            table_view_outlet.delegate = self
            table_view_outlet.dataSource = self
            table_view_outlet.rowHeight = 102
        }
    }
    
    @IBOutlet weak var rating_view_outlet: UIView!
    
}
extension yorumlarViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getFalciYorum["data"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table_view_outlet.dequeueReusableCell(withIdentifier: "yorumlarTableViewCell",for: indexPath) as! yorumlarTableViewCell
        cell.comment_label_outlet.text = getFalciYorum["data"][indexPath.item]["comment"].stringValue.htmlToString
        cell.date_label_outlet.text = getFalciYorum["data"][indexPath.item ]["yorum_tarih"].stringValue
       if getFalciYorum["data"][indexPath.item]["rating"].stringValue == "4"{
           cell.enson_view_outlet.isHidden = true
       }else if
        getFalciYorum["data"][indexPath.item]["rating"].stringValue == "3"{
           cell.sondaniki_view_outlet.isHidden = true
           cell.enson_view_outlet.isHidden = true
       }else if
        getFalciYorum["data"][indexPath.item]["rating"].stringValue == "2"{
           cell.sondanüç_view_outlet.isHidden = true
           cell.sondaniki_view_outlet.isHidden = true
           cell.enson_view_outlet.isHidden = true
       }else if
        getFalciYorum["data"][indexPath.item]["rating"].stringValue == "1"{
           cell.sondandört_view_outlet.isHidden = true
           cell.sondanüç_view_outlet.isHidden = true
           cell.sondaniki_view_outlet.isHidden = true
           cell.enson_view_outlet.isHidden = true
       }
      
        
        return cell

        }
    }

extension yorumlarViewController{
    //ALAMOFIRE JSON
    func posts_request_json(id: String){
        let parameters : Parameters = [
            "falci_id": id,
            "start":"",
            "end":10
        ]
        let url = apiURL + "/getFalciYorum"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseJSON { [self]
            response in
            
            switch response.result {
            case .success(let value):
                
                getFalciYorum = JSON(value)
                table_view_outlet.reloadData()
               print("DATA : \(getFalciYorum)")
            case .failure(let error):
                Swift.print(error)
        }
        }
}
}


