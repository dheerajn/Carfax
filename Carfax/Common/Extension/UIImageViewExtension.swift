//
//  UIImageViewExtension.swift
//  Carfax
//
//  Created by Dheeru on 8/15/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import Kingfisher

public extension UIImageView {
    
    /// Downloads the image with the given url.
    ///
    /// - Parameters:
    ///   - forUrl: Url to download from
    ///   - defaultImage: Default image to show when service fails.
    ///   - completionBlock: Block to execute once we get the response.
    func downloadImage(forUrl: String, defaultImage: UIImage, completionBlock: ((Bool) -> Void)?) {
        let url = URL(string: forUrl)
        let placeholderImage = defaultImage
        self.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        
        self.kf.setImage(with: url, placeholder: placeholderImage, options: [.transition(.fade(0.2)), .processor(processor)]) { (result) in
            switch result {
            case .success(let value):
                print("Image Got from:", value.cacheType)
                completionBlock?(true)
                
            case .failure(let error):
                completionBlock?(false)
                print(error.localizedDescription)
            }
        }
    }
}
