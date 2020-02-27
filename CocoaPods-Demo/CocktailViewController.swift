//
//  ViewController.swift
//  CocoaPods-Demo
//
//  Created by Maitree Bain on 2/27/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailViewController: UIViewController {
    
    private let cocktailView = CocktailView()
    
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
       let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchCocktail))
        gesture.direction = .left
        return gesture
    }()
    
    override func loadView() {
        view = cocktailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        fetchCocktail()
        
        //setup swipe gesture on cocktailImage
        cocktailView.cocktailImage.isUserInteractionEnabled = true
        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
    }
    
    //shake device to change cocktail
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchCocktail()
        }
    }
    
    @objc private func fetchCocktail() {
        APIClient.fetchCocktail { [] (result) in
            
            switch result {
            case .failure(let error):
                print("no cocktail: \(error)")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self.updateUI(cocktail)
                }
            }
        }
    }
    
    private func updateUI(_ cocktail: Cocktail) {
        cocktailView.cocktailNameLabel.text = "\(cocktail.strDrink)"
        
        guard let imageUrl = URL(string: cocktail.strDrinkThumb) else {return }
        cocktailView.cocktailImage.kf.setImage(with: imageUrl)
        cocktailView.cocktailIngredients.text = "\(cocktail.ingredients)"
        
        UIView.transition(with: cocktailView.cocktailImage, duration: 0.8, options: [.transitionFlipFromRight, .curveEaseIn], animations: {
            self.cocktailView.cocktailImage.kf.setImage(with: imageUrl)
        }, completion: nil)
    }
    
}

