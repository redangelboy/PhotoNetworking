//
//  PhotoTableViewCell.swift
//  IntroNetworking
//
//  Created by Consultant on 11/7/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    lazy var ImageView : UIImageView = {

        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "1 gokultra")
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        
        
        
        return image
        
    
        
        
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        setUPImg()
        // Initialization code
    }

    func setUPImg () {
        
        self.backgroundColor = .systemRed
        
        self.contentView.addSubview(self.ImageView)
        
        self.ImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.ImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.ImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        

        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
