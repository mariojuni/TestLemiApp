//
//  SearchCell.swift
//  TestLemiApp
//
//  Created by Mario Juni on 22/04/2019.
//  Copyright © 2019 VeritasPay Inc. All rights reserved.
//

import UIKit
import IBAnimatable
import Nuke
class SearchCell: UITableViewCell {

    @IBOutlet weak var titleImageView: AnimatableImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleImageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    func  configure(data : City)  {
        if let url =  data.banner {
            Nuke.loadImage(with: URL(string: url)!, into: titleImageView)
            titleImageLabel.isHidden = true
            titleImageView.backgroundColor = nil
        }else {
            titleImageLabel.isHidden = false
            titleImageView.image = nil
            titleImageView.backgroundColor = UIColor.init(hexString: data.color!)
            titleImageLabel.text =  String(data.name!.prefix(3))
        }
        
        titleLabel.text = data.name
        subTitleLabel.text = data.subtitle
        
    }
}

