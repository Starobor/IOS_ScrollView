//
//  ViewController.swift
//  ScrollView
//
//  Created by Citizen on 08.09.2018.
//  Copyright © 2018 Citizen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var newScrollView = UIScrollView()
    var newImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScrollView()
        let iphone6S = UIImage(named: "iphone_6s")
        let iphoneX = UIImage(named: "iphoneX")
        let macbook = UIImage(named: "macbook")
        
        var imageViewRect = self.view.bounds
        let iPhone6SImageView = newImageViewWithImage(paramImage: iphone6S!, paramFrame: imageViewRect)
        
        newScrollView.addSubview(iPhone6SImageView)
  
        
        imageViewRect.origin.x += imageViewRect.size.width
        let iPhoneXImageView = newImageViewWithImage(paramImage: iphoneX!, paramFrame: imageViewRect)
        newScrollView.addSubview(iPhoneXImageView)
        
        imageViewRect.origin.x += imageViewRect.size.width
        let macbookImageView = newImageViewWithImage(paramImage: macbook!, paramFrame: imageViewRect)
        newScrollView.addSubview(macbookImageView)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("start scroll")
        print(scrollView.contentOffset.y)
        scrollView.alpha = 0.50
    }
    
    func scrollViewDidEndDragging (_ scrollView: UIScrollView) {
        print("end dragging")
        scrollView.alpha = 1.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("end decelerating")
        scrollView.alpha = 1.0
    }
    
    func addScrollView() {
        let scrollViewRect = self.view.bounds
        newScrollView.indicatorStyle = .black
        newScrollView = UIScrollView(frame: self.view.bounds)
        newScrollView.isPagingEnabled = true
        newScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        newScrollView.delegate = self
        self.view.addSubview(newScrollView)
    }
    
    func newImageViewWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
    }
    
}

