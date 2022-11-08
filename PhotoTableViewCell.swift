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
        image.backgroundColor = .systemBlue
        
//        image.contentMode = .scaleAspectFit
    
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            setUPImg()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

//    override func awakeFromNib() {
//        super.awakeFromNib()
//
////        setUPImg()
//        // Initialization code
//    }


    func setUPImg () {
        
        self.backgroundColor = .white
        
        self.contentView.addSubview(self.ImageView)
        
        self.ImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.ImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.ImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.ImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.ImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.ImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


