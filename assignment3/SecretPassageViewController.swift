import UIKit

class SecretPassageViewController: UIViewController {

    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "secret_passage"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let dungeonButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Dungeon", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let labratoryButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Labratory", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let mysteriousLakeButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Mysterious Lake", for: .normal)
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
        title = "Secret Passage"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        view.addSubview(buttonsArea)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        buttonsArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        buttonsArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        buttonsArea.topAnchor.constraint(equalTo: rooms.bottomAnchor, constant: 50).isActive = true
        
        buttonsArea.addArrangedSubview(dungeonButton)
        buttonsArea.addArrangedSubview(labratoryButton)
        buttonsArea.addArrangedSubview(mysteriousLakeButton)
        
        dungeonButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        labratoryButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        mysteriousLakeButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(exit))
        self.navigationItem.rightBarButtonItem = rightBtn
        
    }
   
    @objc func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func goToNextRoom(_ sender: UIButton) {
        if sender.currentTitle! == "Dungeon" {
            let dungeonVC = DungeonViewController()
            navigationController?.pushViewController(dungeonVC, animated: true)
        } else if sender.currentTitle! == "Labratory" {
            let labratoryVC = LabratoryViewController()
            navigationController?.pushViewController(labratoryVC, animated: true)
        } else if sender.currentTitle! == "Mysterious Lake" {
            let mysteriousLakeVC = MysteriousLakeViewController()
            navigationController?.pushViewController(mysteriousLakeVC, animated: true)
        }
    }
    
    
    
}

