//
//  ViewController.swift
//  rb685_p3
//
//  Created by Trey Burrell on 10/15/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit
protocol ChangeButtonTitleDelegate: class {
    func redButtonTitleChanged(newTitle: String)
    func blueButtonTitleChanged(newTitle: String)
}

class ViewController: UIViewController {
    var pushBlueViewControllerButton: UIButton!
    var pushRedViewControllerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the title of the Controller
        title = "Drawing Arena"
        
        pushRedViewControllerButton = UIButton()
        pushRedViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushRedViewControllerButton.setTitle("Red Square Arena", for: .normal)
        pushRedViewControllerButton.setTitleColor(.red, for: .normal)
        pushRedViewControllerButton.addTarget(self, action: #selector(pushRedViewController), for: .touchUpInside)
        view.addSubview(pushRedViewControllerButton)
        
        pushBlueViewControllerButton = UIButton()
        pushBlueViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushBlueViewControllerButton.setTitle("Blue Circle Arena", for: .normal)
        pushBlueViewControllerButton.setTitleColor(.blue, for: .normal)
        pushBlueViewControllerButton.addTarget(self, action: #selector(pushBlueViewController), for: .touchUpInside)
        view.addSubview(pushBlueViewControllerButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushRedViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushRedViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushRedViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            pushBlueViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushBlueViewControllerButton.topAnchor.constraint(equalTo: pushRedViewControllerButton.bottomAnchor, constant: 16),
            pushBlueViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }

    
    @objc func pushRedViewController() {
        let redViewController = RedViewController()
        redViewController.delegate = self
        navigationController?.pushViewController(redViewController, animated: true)
    }
    
    @objc func pushBlueViewController() {
        let blueViewController = BlueViewController()
        blueViewController.delegate = self
        navigationController?.pushViewController(blueViewController, animated: true)
    }
}
extension ViewController: ChangeButtonTitleDelegate {
    func blueButtonTitleChanged(newTitle: String) {
        pushBlueViewControllerButton.setTitle(newTitle, for: .normal)
    }
    
    func redButtonTitleChanged(newTitle: String) {
        pushRedViewControllerButton.setTitle(newTitle, for: .normal)
    }
    



}

