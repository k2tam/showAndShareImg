//
//  ViewController.swift
//  UIActivityVC
//
//  Created by k2 tam on 16/08/2023.
//

import UIKit

class MainVC: UIViewController {
    
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.image = UIImage(named: "img.png")
        return imgView
    }()
    
    
    // Add a property to keep track of tap gesture recognizer's state
      private var tapGestureRecognizer: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.backgroundColor = .systemBackground
        setupImageView()
        setupUI()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        tapGestureRecognizer?.isEnabled = true

    }
    
    private func setupUI() {
        view.addSubview(imgView)
        
        NSLayoutConstraint.activate([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 200),
            imgView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    private func setupImageView() {
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagePressed))

        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer!)
        
    }
    
    //Go to show image
    @objc func imagePressed() {
        // Disable the tap gesture recognizer to prevent further taps
        tapGestureRecognizer?.isEnabled = false
        
        guard let imageToShow = imgView.image else {
            print("No image to show")
            return
        }
        
        let showImageVC = ShowImageVC()
        showImageVC.image = imageToShow
        navigationController?.pushViewController(showImageVC, animated: false)
        
        
    }
}

