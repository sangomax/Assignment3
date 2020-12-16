import UIKit

class FrontDoorViewController: UIViewController {
    
    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "front_door"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let coatRoomButton: UIButton = {
      let btn = UIButton(type: .system)
      btn.setTitle("Coat Room", for: .normal)
      btn.translatesAutoresizingMaskIntoConstraints = false
      return btn
    }()
    
    let buttonsArea: UIStackView = {
        let area = UIStackView()
        area.axis = .vertical
        area.alignment = .center
        area.distribution = .fillEqually
        area.spacing = 20
        area.translatesAutoresizingMaskIntoConstraints = false
        return area
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Front Door"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        view.addSubview(buttonsArea)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        buttonsArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        buttonsArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        buttonsArea.topAnchor.constraint(equalTo: rooms.bottomAnchor, constant: 50).isActive = true

        buttonsArea.addArrangedSubview(coatRoomButton)
        buttonsArea.addArrangedSubview(UIView())
        buttonsArea.addArrangedSubview(UIView())
        
        coatRoomButton.addTarget(self, action: #selector(goToCoatRoom(_:)), for: .touchUpInside)
    }

    
    @objc func goToCoatRoom(_ sender: UIButton) {
      let coatRoomVC = CoatRoomViewController()
      navigationController?.pushViewController(coatRoomVC, animated: true)
    }

}

