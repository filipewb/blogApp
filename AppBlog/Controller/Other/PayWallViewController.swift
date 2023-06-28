//
//  PayWallViewController.swift
//  AppBlog
//
//  Created by Filipe Boeck on 22/06/23.
//

import UIKit

class PayWallViewController: UIViewController {
    
    private let header = PayWallHeaderView()
    
    private let heroView = PayWallDescriptionView()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Se inscrever", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Não inscrever", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let termsView: UITextView = {
        let text = UITextView()
        text.isEditable = false
        text.textAlignment = .center
        text.textColor = .secondaryLabel
        text.font = .systemFont(ofSize: 14)
        text.text = "Para usar, basta clicar em se inscrever e postar a vontade no nosso app!"
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AppBlog! Se inscreva!"
        view.backgroundColor = .systemBackground
        
        view.addSubview(header)
        view.addSubview(buyButton)
        view.addSubview(restoreButton)
        view.addSubview(termsView)
        view.addSubview(heroView)
        
        setUpCloseButton()
        setUpButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        header.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height/3.2)
        
        termsView.frame = CGRect(x: 10, y: view.height - 100, width: view.width - 20, height: 100)
        
        restoreButton.frame = CGRect(x: 25, y: termsView.top - 70, width: view.width - 50, height: 50)
        
        buyButton.frame = CGRect(x: 25, y: restoreButton.top - 60, width: view.width - 50, height: 50)
        
        heroView.frame = CGRect(x: 0, y: header.bottom, width: view.width, height: buyButton.top - view.safeAreaInsets.top - header.height)
    }
    
    private func setUpButtons() {
        buyButton.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(didTapRestore), for: .touchUpInside)
    }
    
    @objc private func didTapSubscribe() {
        dismiss(animated: true)
    }
    
    @objc private func didTapRestore() {
        let alert = UIAlertController(title: "Não comprou", message: "Você precisa comprar para prosseguir.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setUpCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
}
