//
//  falcidetayTableViewCell.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit
import Kingfisher
class falcidetayTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBOutlet weak var view_outlet: UIView!{
        didSet{
            view_outlet.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var name_label_outlet: UILabel!
    
    @IBOutlet weak var onecikar_button_outlet: UIButton!
    
    @IBOutlet weak var stars_view_outlet: UIImageView!
    @IBOutlet weak var kredi_label_outlet: UILabel!
    @IBOutlet weak var fal_baktir_view_outlet: button_desing!
    
    @IBOutlet weak var image_view_outlet: AnimatedImageView!
    
    
    
}
