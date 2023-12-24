//
//  TargetView.swift
//  HomeworkBrowser
//
//  Created by Иван Знак on 24/12/2023.
//

import UIKit

protocol TargetViewDelegate: AnyObject{
    func buttonBackPressed(_ sender: TargetView)
    func buttonForwardPressed(_ sender: TargetView)
    func buttonRestartPressed(_ sender: TargetView)
    func buttonSearchPressed(_ sender: TargetView)
}

class TargetView: UIView {
    
    let buttonBack = UIButton(type: .system)
    let buttonForward = UIButton(type: .system)
    let searchField = UITextField()
    let buttonSearch = UIButton(type: .system)
    let buttonRestart = UIButton(type: .system)
    weak var delegate: TargetViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraint()
        buttonStartParameters()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Constraints
    func setConstraint(){
        addSubview(buttonBack)
        addSubview(buttonForward)
        addSubview(searchField)
        addSubview(buttonRestart)
        addSubview(buttonSearch)
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        buttonForward.translatesAutoresizingMaskIntoConstraints = false
        searchField.translatesAutoresizingMaskIntoConstraints = false
        buttonRestart.translatesAutoresizingMaskIntoConstraints = false
        buttonSearch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonBack.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonBack.topAnchor.constraint(equalTo: topAnchor),
            buttonBack.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonBack.heightAnchor.constraint(equalTo: buttonBack.widthAnchor, multiplier: 1),
            
            
            buttonForward.leadingAnchor.constraint(equalTo: buttonBack.trailingAnchor, constant: 5),
            buttonForward.topAnchor.constraint(equalTo: topAnchor),
            buttonForward.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonForward.heightAnchor.constraint(equalTo: buttonForward.widthAnchor, multiplier: 1),
            
            
            searchField.leadingAnchor.constraint(equalTo: buttonForward.trailingAnchor, constant: 10),
            searchField.topAnchor.constraint(equalTo: topAnchor),
            searchField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            buttonSearch.leadingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: 10),
            buttonSearch.trailingAnchor.constraint(equalTo: buttonRestart.leadingAnchor, constant: -5),
            buttonSearch.topAnchor.constraint(equalTo: topAnchor),
            buttonSearch.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonSearch.heightAnchor.constraint(equalTo: buttonSearch.widthAnchor, multiplier: 1),
            
            
            buttonRestart.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonRestart.topAnchor.constraint(equalTo: topAnchor),
            buttonRestart.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonRestart.heightAnchor.constraint(equalTo: buttonRestart.widthAnchor, multiplier: 1)
        ])
    }
    
    func buttonStartParameters(){
        buttonBack.setImage(UIImage(named: "chevron.left"), for: .normal)
        buttonBack.imageView?.image?.withTintColor(.systemGray)
        buttonBack.addTarget(self, action: #selector(buttonBackTapped), for: .touchUpInside)
            
        buttonForward.setImage(UIImage(named: "chevron.right"), for: .normal)
        buttonForward.imageView?.image?.withTintColor(.systemGray)
        buttonForward.addTarget(self, action: #selector(buttonForwardTapped), for: .touchUpInside)
            
        buttonRestart.setImage(UIImage(named: "arrow.counterclockwise"), for: .normal)
        buttonRestart.imageView?.image?.withTintColor(.systemBlue)
        buttonRestart.addTarget(self, action: #selector(buttonRestartTapped), for: .touchUpInside)
        
        buttonSearch.setImage(UIImage(named: "magnifyingglass"), for: .normal)
        buttonSearch.imageView?.image?.withTintColor(.systemBlue)
        buttonSearch.addTarget(self, action: #selector(buttonSearchTapped), for: .touchUpInside)
    }
        
    @objc func buttonBackTapped(){
        delegate?.buttonBackPressed(self)
    }
    
    @objc func buttonForwardTapped(){
        delegate?.buttonForwardPressed(self)
    }
    
    @objc func buttonSearchTapped(){
        delegate?.buttonSearchPressed(self)
    }
    @objc func buttonRestartTapped(){
        delegate?.buttonRestartPressed(self)
    }
    
}

