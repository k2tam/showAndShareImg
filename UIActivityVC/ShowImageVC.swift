//
//  ShowImageVC.swift
//  UIActivityVC
//
//  Created by k2 tam on 16/08/2023.
//

import UIKit

class ShowImageVC: UIViewController {
    
    var image: UIImage!
    
    private let closeBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "ic_close"), for: .normal)
        return btn
    }()
    
    private let shareBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "ic_share"), for: .normal)
        return btn
    }()
    
    private let imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "img.png")
        return imgView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        closeBtn.isUserInteractionEnabled = true
        closeBtn.addTarget(self, action: #selector(closeBtnPressed), for: .touchUpInside)
        shareBtn.addTarget(self, action: #selector(shareBtnPressed), for: .touchUpInside)   

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(closeBtn)
        view.addSubview(shareBtn)
        view.addSubview(imgView)
        
        NSLayoutConstraint.activate([
            self.closeBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            self.closeBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            self.shareBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            self.shareBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            self.imgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            self.imgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            self.imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            self.imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
    }
    
    @objc func closeBtnPressed() {
        navigationController?.popViewController(animated: false)
    }
    
    private func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)

            // Prevent the navigation bar from showing
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    
    @objc func shareBtnPressed() {
        guard let image = image else {
            print("No image to share")
            return
        }
        
        hideNavigationBar()

        
        let shareSheetVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        // Set up the completion handler
        shareSheetVC.completionWithItemsHandler = { [weak self] activityType, completed, returnedItems, error in
            // This closure will be called when the sharing is complete or canceled
            
            // Hide the navigation bar
            self?.hideNavigationBar()
        }
        

        
        present(shareSheetVC, animated: true )
//
//        // Add a tap gesture recognizer to detect taps outside the shareSheetVC
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideShareSheet(_:)))
//        tapGesture.cancelsTouchesInView = false
//        view.window?.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    
}
