//
//  RedViewController.swift
//  rb685_p3
//
//  Created by Trey Burrell on 10/16/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
    var Save: UIButton!
    var textF: UITextField!
    weak var delegate: ChangeButtonTitleDelegate?
    var redView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.text = "Change ViewController's text"
        textF.borderStyle = .roundedRect
        textF.backgroundColor = .white
        textF.textAlignment = .center
        view.addSubview(textF)
        
        
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(dismissViewandSave))
        self.navigationItem.rightBarButtonItem = saveButton
        
        setupConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        redView.center = touches.first!.location(in: view)
        redView.backgroundColor = .red
        view.addSubview(redView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textF.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textF.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textF.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textF.heightAnchor.constraint(equalToConstant: 24)
            ])
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissViewandSave() {
        if let text = textF.text, text != "" {
        delegate?.redButtonTitleChanged(newTitle: text)
        
        }
        else{
            let aController = UIAlertController(title: "Invalid Entry", message: "Entry cannot be empty", preferredStyle: .alert)
            let aAction = UIAlertAction(title: "Close", style: .cancel, handler: nil)
            aController.addAction(aAction)
            self.present(aController, animated: true, completion: nil)
        }
        
        navigationController?.popViewController(animated: true)
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
