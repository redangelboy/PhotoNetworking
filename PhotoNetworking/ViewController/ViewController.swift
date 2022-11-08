

import UIKit

//TODO: Add in logic to update image request on orrieentation change

class ViewController: UIViewController {
    
    var tableView: UITableView?

    
    lazy var stockImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGreen
        imageView.layer.cornerRadius = 50.0
        return imageView
    }()
    
    let network = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpUI()
        
    }
    

    func setUpUI(){
        self.view.backgroundColor = .white
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.dataSource = self
        table.register(PhotoTableViewCell.self, forCellReuseIdentifier: "ProgCell")
        
        //        Add View to Hierarchy
        self.view.addSubview(table)
       
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
  
        self.tableView = table
    }

}
    

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell", for: indexPath) as? PhotoTableViewCell   else{
            fatalError("Whoops, something when wrong")
        }
        
        
        
        _ = stockImageView.frame
        self.network.fetchImageData(path: "https://picsum.photos/200/100") { data in

//        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))") { [weak self] data in
            guard let data = data else { return }
            print(data)
            DispatchQueue.main.async {
                print(data)
                cell.ImageView.image = UIImage(data: data)

            }
        }
    
        return cell
    }
    

}
