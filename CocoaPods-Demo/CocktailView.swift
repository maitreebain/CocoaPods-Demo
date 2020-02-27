//
//  CocktailView.swift
//  CocoaPods-Demo
//
//  Created by Maitree Bain on 2/27/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    //cocktail Name label
    public lazy var cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        label.text = "Cocktail Name"
        return label
    }()
    
    //cocktail image
    public lazy var cocktailImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo")
        return iv
    }()
    
    public lazy var cocktailIngredients: UITextView = {
        let text = UITextView()
        text.font = UIFont.preferredFont(forTextStyle: .subheadline)
        text.text = "Cocktail Ingr"
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setUpCocktailImageConstraints()
        setUpNameLabelConstraints()
        setUpIngredientsConstraints()
    }
    
    private func setUpCocktailImageConstraints() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setUpNameLabelConstraints() {
        addSubview(cocktailNameLabel)
        
        cocktailNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().offset(20)
        }
    }
    
    private func setUpIngredientsConstraints(){
        addSubview(cocktailIngredients)
        
        cocktailIngredients.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().offset(-20)
            make.height.equalToSuperview().multipliedBy(0.2)
        }
    }
    
}
