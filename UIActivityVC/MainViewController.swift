//
//  ViewController.swift
//  UIActivityVC
//
//  Created by k2 tam on 16/08/2023.
//

import UIKit

class MainVC: UIViewController {
    
    private let imgView = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupImageView()
        // Do any additional setup after loading the view.
        
    }
    
    private func setupImageView() {
        view.addSubview(imgView)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagePressed))
        
        imgView.image = UIImage(named: "img.png")
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
        
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 200),
            imgView.heightAnchor.constraint(equalToConstant: 200),
        ])
           
    }


    @objc func imagePressed() {
        print("hello")
    }
}

