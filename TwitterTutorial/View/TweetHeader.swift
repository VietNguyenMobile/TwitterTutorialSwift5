//
//  TweetHeader.swift
//  TwitterTutorial
//
//  Created by Macbook on 21/03/2023.
//

import UIKit

class TweetHeader: UICollectionReusableView {
    
    // MARK: - Properties
   
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPurple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
