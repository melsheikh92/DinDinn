//
//  SliderView.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import UIKit
import DinDinnCore
import DinDinnResources

class SliderView: UIView {
    // MARK: Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet var overLayView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    fileprivate var currentIndex: Int = 0
    private var timer: Timer!
    
    // Mark: Data
    var items: [DicountDto]? {
        didSet {
            // to make sure that view has been layouted
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.fillData()
            })
        }
    }
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(String(describing: SliderView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    // Mark: fill data
    func fillData() {
        guard let items = self.items, items.count > 0 else {
            return
        }
        let scrollViewWidth: CGFloat = scrollView.frame.width
        let scrollViewHeight: CGFloat = scrollView.frame.height
        
        for (index, item) in items.enumerated() {
            let imageView = UIImageView(frame: CGRect(x: scrollViewWidth * CGFloat(index),
                                                      y: 0,
                                                      width: scrollViewWidth,
                                                      height: scrollViewHeight))
            imageView.loadFrom(urlString: item.image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(items.count),
                                        height: scrollView.frame.height)
        pageController.numberOfPages = items.count
        
        setupPeriodicallySliding()
    }
    
    // MARK: Actions
    @IBAction func pageControlTap(_ sender: Any?) {
        guard let pageControl: UIPageControl = sender as? UIPageControl else {
            return
        }
        timer.invalidate()
        setupPeriodicallySliding()
        scrollToIndex(index: pageControl.currentPage)
    }
    
    // MARK: Setup Timer for auto slide
    func setupPeriodicallySliding() {
        timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { [weak self] timer in
            self?.scrollToNext()
        }
    }
    
    // Mark: ScrollView
    func scrollToIndex(index: Int) {
        UIView.animate(withDuration: 0.4) {
            let pageWidth: CGFloat = self.scrollView.frame.width
            let slideToX: CGFloat  = CGFloat(index) * pageWidth
            self.scrollView.scrollRectToVisible(CGRect(x: slideToX, y:0, width:pageWidth, height: self.scrollView.frame.height), animated: true)
        }
    }
    
    func scrollToNext() {
        guard let items = items else { return }
        currentIndex += 1
        currentIndex = currentIndex < items.count ? currentIndex : 0
        scrollToIndex(index: currentIndex)
    }
}

// MARK: UIScrollViewDelegate
extension SliderView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageWidth:CGFloat = self.scrollView.frame.width
            let currentPage:CGFloat = floor((scrollView.contentOffset.x - (pageWidth / 2)) / pageWidth) + 1
            self.pageController.currentPage = Int(currentPage)
    }
}
