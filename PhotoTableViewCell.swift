

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    lazy var ImageView : UIImageView = {

        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemBlue
        
        image.contentMode = .scaleAspectFit
    
        return image
    }()
    
    lazy var TopLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .systemCyan
        label.numberOfLines = 0
        label.text = "Random Image"
        
        
        return label
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
            setUPImg()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setUPImg () {
        
        self.backgroundColor = .white
        
        self.contentView.addSubview(self.ImageView)
        self.contentView.addSubview(self.TopLabel)
        
        self.ImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.ImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.ImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
//        self.ImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        self.ImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.ImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true

        self.TopLabel.leadingAnchor.constraint(equalTo: self.ImageView.trailingAnchor, constant: 10).isActive = true
        self.TopLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true


        
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


