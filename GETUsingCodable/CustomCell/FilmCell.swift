//
//  FilmTableViewCell.swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class FilmCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
