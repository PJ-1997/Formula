//
//  StackView.swift
//  Formula
//
//  Created by Pedro on 2/3/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

class CalculateStackView: UIStackView {
    
    var vc: CalculateController? {
        didSet {
            lefttextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
            middleTextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
            rightTextField.addTarget(vc, action: #selector(vc?.handleTextFields), for: .editingChanged)
            calculateButton.addTarget(vc, action: #selector(vc?.handleCalculate), for: .touchUpInside)
        }
    }
    
    //Top
    var formulaTitle: UILabel = {
        let label = UILabel()
        label.font = Theme.fonts.fontFormulaBold(size: 30)
        label.text = "Formula Title"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var formulaImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "metallica")
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let topStackView = UIStackView()
    //Middle
    let lefttextField: UITextField = {
        let textfield = UITextField()
        textfield.styleTextField()
        return textfield
    }()
    
    let middleTextField: UITextField = {
        let textfield = UITextField()
        textfield.styleTextField()
        return textfield
    }()
    
    let rightTextField: UITextField = {
        let textfield = UITextField()
        textfield.styleTextField()
        return textfield
    }()
    
    let middleStackView = UIStackView()
    //bottom
    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Solve", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.backgroundColor = .red
        button.titleLabel?.font = Theme.fonts.fontFormulaBold(size: 20)
        return button
    }()
    
    var answerLabel: UILabel = {
        let label = UILabel()
        label.text = "Answer PlaceHolder"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackViews()
        
    }
    
    func setupStackViews() {
        //MARK: Top StackView
//                let topStackView = UIStackView(arrangedSubviews: [formulaTitle, formulaImage])
        topStackView.addArrangedSubview(formulaTitle)
        topStackView.addArrangedSubview(formulaImage)
        topStackView.axis = .vertical
        topStackView.spacing = 8
        topStackView.isLayoutMarginsRelativeArrangement = true
        
        //Enables auto layout
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(topStackView)
        
        topStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 8, left: 8, bottom: 0, right: 8))
        formulaImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //MARK: Middle StackView
        middleStackView.addArrangedSubview(lefttextField)
        middleStackView.addArrangedSubview(middleTextField)
        middleStackView.addArrangedSubview(rightTextField)
        middleStackView.distribution = .fillEqually
        middleStackView.spacing = 8
        middleStackView.isLayoutMarginsRelativeArrangement = true
        
        //Enables auto layout
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(middleStackView)
        
        middleStackView.anchor(top: topStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 20, left: 8, bottom: 0, right: 8))
        middleStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //MARK: Bottom StackView
        bottomStackView.addArrangedSubview(calculateButton)
        bottomStackView.addArrangedSubview(answerLabel)
        bottomStackView.axis = .vertical
        bottomStackView.distribution = .fillEqually
        bottomStackView.spacing = 8
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        
        //Enables auto layout
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomStackView)
        
        bottomStackView.anchor(top: middleStackView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 50, left: 8, bottom: 0, right: 8))
        bottomStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
