//
//  ShowImageVC.swift
//  UIActivityVC
//
//  Created by k2 tam on 16/08/2023.
//

import UIKit

class ShowImageVC: UIViewController {
    
    private var image: UIImage?
    
    func setImageReview(image: UIImage) {
        self.image = image
    }
    
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
    
    @objc private func closeBtnPressed() {
        navigationController?.popViewController(animated: false)
    }
    

    
    @objc private func shareBtnPressed() {
        guard let image = image else {
            print("No image to share")
            return
        }
          
        let shareSheetVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
  
        present(shareSheetVC, animated: true )
        
    }
    
    
    
    
}
