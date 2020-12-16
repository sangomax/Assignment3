import UIKit

class DungeonViewController: UIViewController {

    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "dungeon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        title = "Dungeon"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        view.addSubview(buttonsArea)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        buttonsArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        buttonsArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        buttonsArea.topAnchor.constraint(equalTo: rooms.bottomAnchor, constant: 50).isActive = true

        buttonsArea.addArrangedSubview(UIView())
        buttonsArea.addArrangedSubview(UIView())
        buttonsArea.addArrangedSubview(UIView())
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(exit))
        self.navigationItem.rightBarButtonItem = rightBtn
    }
   
    @objc func exit() {
        navigationController?.popToRootViewController(animated: true)
    }

}

