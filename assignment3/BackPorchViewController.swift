//
//  BackPorchViewController.swift
//  assignment3
//
//  Created by Adriano Gaiotto de Oliveira on 2020-12-15.
//

import UIKit

class BackPorchViewController: UIViewController {

    let rooms: UIImageView = {
        let image = UIImageView(image: UIImage(named: "back_porch"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Back Porch"
        view.backgroundColor = .white
        
        view.addSubview(rooms)
        
        rooms.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        rooms.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        rooms.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(exit))
        self.navigationItem.rightBarButtonItem = rightBtn
        
    }
    
   
    @objc func exit() {
        navigationController?.popToRootViewController(animated: true)
    }


}

