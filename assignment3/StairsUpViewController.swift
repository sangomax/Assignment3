//
//  StairsUpViewController.swift
//  assignment3
//
//  Created by Adriano Gaiotto de Oliveira on 2020-12-15.
//

import UIKit

class StairsUpViewController: UIViewController {

    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "stairs_up"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bedroomButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Bedroom", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let bathroomButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Bathroom", for: .normal)
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
        title = "Stairs Up"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        view.addSubview(buttonsArea)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        buttonsArea.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        buttonsArea.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        buttonsArea.topAnchor.constraint(equalTo: rooms.bottomAnchor, constant: 50).isActive = true
        
        buttonsArea.addArrangedSubview(bedroomButton)
        buttonsArea.addArrangedSubview(bathroomButton)
        buttonsArea.addArrangedSubview(UIView())
        
        bedroomButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        bathroomButton.addTarget(self, action: #selector(goToNextRoom(_:)), for: .touchUpInside)
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(exit))
        self.navigationItem.rightBarButtonItem = rightBtn
        
    }
   
    @objc func exit() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func goToNextRoom(_ sender: UIButton) {
        if sender.currentTitle! == "Bedroom" {
            let bedroomVC = BedroomViewController()
            navigationController?.pushViewController(bedroomVC, animated: true)
        } else if sender.currentTitle! == "Bathroom" {
            let bathroomVC = BathroomViewController()
            navigationController?.pushViewController(bathroomVC, animated: true)
        } 
    }
    
    
    
}

