//
//  yorumlarTableViewCell.swift
//  fal_application_2
//
//  Created by Selin Çağlar on 18.02.2022.
//

import UIKit

class yorumlarTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var comment_label_outlet: UILabel!
    @IBOutlet weak var date_label_outlet: UILabel!
    @IBOutlet weak var rating_view_outlet: UIView!
    @IBOutlet weak var enson_view_outlet: UIImageView!
    @IBOutlet weak var sondaniki_view_outlet: UIImageView!
    @IBOutlet weak var sondanüç_view_outlet: UIImageView!
    @IBOutlet weak var sondandört_view_outlet: UIImageView!
    @IBOutlet weak var bas_view_outlet: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
        
    }

}
