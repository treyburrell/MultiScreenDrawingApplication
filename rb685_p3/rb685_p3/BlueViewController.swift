//
//  RedViewController.swift
//  rb685_p3
//
//  Created by Trey Burrell on 10/16/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    var Save: UIButton!
    var textF: UITextField!
    weak var delegate: ChangeButtonTitleDelegate?
    var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.text = "Change ViewController's Text"
        textF.borderStyle = .roundedRect
        textF.backgroundColor = .white
        textF.textAlignment = .center
        view.addSubview(textF)
        
        
        Save = UIButton()
        Save.translatesAutoresizingMaskIntoConstraints = false
        Save.setTitle("Dismiss and Save", for: .normal)
        Save.backgroundColor = .gray
        Save.setTitleColor(.blue, for: .normal)
        Save.addTarget(self, action: #selector(dismissViewandSave), for: .touchUpInside)
        view.addSubview(Save)
        
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        blueView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        blueView.center = touches.first!.location(in: view)
        blueView.backgroundColor = .blue
        blueView.layer.cornerRadius = 25
        view.addSubview(blueView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textF.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            Save.topAnchor.constraint(equalTo: textF.bottomAnchor, constant: 20),
            Save.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Save.heightAnchor.constraint(equalToConstant: 48)
            ])
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissViewandSave() {
        if let text = textF.text, text.trimmingCharacters(in: .whitespaces) != "" {
            delegate?.blueButtonTitleChanged(newTitle: text)
            
        }
        else{
            let aController = UIAlertController(title: "Invalid Entry", message: "Entry cannot be empty", preferredStyle: .alert)
            let aAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            aController.addAction(aAction)
            self.present(aController, animated: true, completion: nil)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    @objc func Save() {
    //        let redViewController = RedViewController()
    //        navigationController?.pushViewController(redViewController, animated: true)
    //    }
    
}
