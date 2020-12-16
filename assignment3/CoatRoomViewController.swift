import UIKit

class CoatRoomViewController: UIViewController {
    
    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "coat_room"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let libraryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Library", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let diningRoomButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Dining Room", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let stairsUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Stairs Up", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let buttonsArea: UIStackView = {
        let area = UIStackView()
        area.axis = .vertical
        area.alignment = .center
        area.distribution = .fillEqually
        area.translatesAutoresizingMaskIntoConstraints = false
        return area
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coat Room"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        view.addSubview(buttonsArea)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        buttonsArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        buttonsArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        buttonsArea.topAnchor.constraint(equalTo: rooms.bottomAnchor, constant: 50).isActive = true
        
        buttonsArea.addArrangedSubview(libraryButton)
        buttonsArea.addArrangedSubview(diningRoomButton)
        buttonsArea.addArrangedSubview(stairsUpButton)
        
        libraryButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        diningRoomButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        stairsUpButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
    }
    
    
    @objc func goToNextRoom(_ sender: UIButton) {
        if sender.currentTitle! == "Stairs Up" {
            let stairUpVC = StairsUpViewController()
            navigationController?.pushViewController(stairUpVC, animated: true)
        } else if sender.currentTitle! == "Dining Room" {
            let diningRoomVC = DiningViewController()
            navigationController?.pushViewController(diningRoomVC, animated: true)
        } else if sender.currentTitle! == "Library" {
            let libraryVC = LibraryViewController()
            navigationController?.pushViewController(libraryVC, animated: true)
        }
    }
    
    
    
}

