//
//  HakkındaViewController.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Kingfisher
class Hakk_ndaViewController: MyController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBOutlet weak var name_falci_label_outlet: UILabel!{
        didSet{
            name_falci_label_outlet.text = falci_detay["data"]["falci_name"].stringValue
        }
    }
    
    @IBOutlet weak var image_view_outlet: AnimatedImageView!{
        didSet{
            Url_To_Image(url: imageBaseURL + falci_detay["data"]["falci_img"].stringValue , imageView: image_view_outlet)
            image_view_outlet.makeRounded()
        }
    }
    
    
    @IBOutlet weak var about_label_outlet: UILabel!{
        didSet{
            about_label_outlet.text = falci_detay["data"]["desc"].stringValue.htmlToString
        }
    }
    
    
    @IBAction func comment_button_action(_ sender: Any) {
        showVC(identifierName: "commentViewController")
    }
    
    
    @IBAction func back_button_action(_ sender: Any) {
        dismiss(animated: true)
    }
}
