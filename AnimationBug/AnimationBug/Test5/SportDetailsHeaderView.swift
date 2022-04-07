//
//  SportDetailsHeaderView.swift
//  BetBoom
//
//  Created by Шкёпу Артём Вячеславович on 01.04.2021.
//

import UIKit

class SportDetailsHeaderView: UIView {
    
    @IBOutlet weak var headerLabel: UILabel!
    var tapOnFavorite: (() -> Void)?
    var tapOnRollup: (() -> Void)?
    
    @IBOutlet weak var arrowButton: UIButton!
    var isSelected = false{
        didSet{
            if isSelected {
//                arrowButton.setBackgroundImage(#imageLiteral(resourceName: "ArrowDown24"), for: .normal)
            }else{
//                arrowButton.setBackgroundImage(#imageLiteral(resourceName: "ArrowUp24"), for: .normal)
                
                
            }
        }
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!{
        didSet{
            titleLabel.textColor = .black
        }
    }

    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBAction func didTapRollup(_ sender: UIButton) {
        tapOnRollup?()
    }
    
    @IBAction func didTapFavorite(_ sender: UIButton) {
        
        tapOnFavorite?()
    }
    
}
