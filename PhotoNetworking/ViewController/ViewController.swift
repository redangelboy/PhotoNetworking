//
//  ViewController.swift
//  IntroNetworking
//
//  Created by Consultant on 11/7/22.
//

import UIKit

//TODO: Add in logic to update image request on orrieentation change

class ViewController: UIViewController {
    
    var tableView: UITableView?

    
    lazy var stockImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGreen
        imageView.layer.cornerRadius = 20.0
        return imageView
    }()
    
    lazy var stockButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 20.0
//        Register functionality
        
        button.addTarget(self, action: #selector(self.stockButtonPressed(_:)), for: .touchUpInside)
        
        return button
    }()
    
    let network = NetworkManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        self.createUI()
        
    }
    

    func setUpUI(){
        self.view.backgroundColor = .lightGray
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.dataSource = self
        
        //        register the cell
        //        table.register(UITableViewCell.self, forCellReuseIdentifier: "SampleCell")
        table.register(PhotoTableViewCell.self, forCellReuseIdentifier: "ProgCell")
        
        //        Add View to Hierarchy
        self.view.addSubview(table)
        
       
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 8).isActive = true
  
        self.tableView = table
    }
    func createUI(){
        
        self.view.addSubview(self.stockImageView)
        self.view.addSubview(self.stockButton)
        
        self.stockImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -8).isActive = true
        self.stockImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockImageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.stockButton.topAnchor.constraint(equalTo: self.stockImageView.bottomAnchor, constant: 8).isActive = true
        self.stockButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.stockButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        

    }
    
    @objc
    func stockButtonPressed(_ sender: UIButton){
        print("Button Pressed")
        
        let frame = self.stockImageView.frame
        
        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))") { [weak self] data in
            guard let data = data else { return }
            print(data)
            DispatchQueue.main.async {
                self?.stockImageView.image = UIImage(data: data)
            }
            
        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell", for: indexPath) as? PhotoTableViewCell   else{
            fatalError("Whoops, something when wrong")
        }
//        cell.textLabel?.text = "\(indexPath)"
//        cell.progImageView.image = UIImage(named: myImages[indexPath[1]])
//        cell.progTopLabel.text = self.data[indexPath.row]
//        cell.progMidLabel.text = self.dataInfo[indexPath.row]
////        cell.progBotLabel.text = self.data[indexPath.row]
        return UITableViewCell()
    }
    
    
    

    
    
    
    

}
