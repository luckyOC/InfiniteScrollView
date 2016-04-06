//
//  ViewController.swift
//  UnlimiteScrollView
//
//  Created by 小小 on 16/4/6.
//  Copyright © 2016年 小小. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pageControl:UIPageControl?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let scrollView = UIScrollView.init(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 6, self.view.frame.height)
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        scrollView.contentOffset = CGPointMake(self.view.frame.width, 0)
        self.view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.orangeColor()
        scrollView.showsHorizontalScrollIndicator = false
        let imageArray = ["fq1.jpg","fq2.jpg","fq3.jpg","fq4.jpg"]
        
        for var i = 0; i < 6; i++ {
            let  imageView = UIImageView.init(frame: CGRectMake(self.view.frame.width * CGFloat(i), 0, self.view.frame.width, self.view.frame.height))
            if i == 0 {
                imageView.image = UIImage.init(named: imageArray[3])
            }
            else if i == 5 {
                imageView.image = UIImage.init(named: imageArray[0])
            }
            else if i != 0 && i != 5 {
                imageView.image = UIImage.init(named: imageArray[i - 1])
            }
            imageView.clipsToBounds = true
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            scrollView.addSubview(imageView)
        }
        self.pageControl = UIPageControl.init(frame: CGRectMake(self.view.frame.width / 2 - 40, self.view.frame.height - 60, 80, 30))
        self.pageControl?.currentPageIndicatorTintColor = UIColor.blackColor()
        self.pageControl?.pageIndicatorTintColor = UIColor.redColor()
        self.pageControl?.numberOfPages = 4
        self.view.addSubview(self.pageControl!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let  curIndex = scrollView.contentOffset.x / self.view.frame.width
        if curIndex == 0 {
            pageControl?.currentPage = 3
            scrollView.setContentOffset(CGPointMake(self.view.frame.width * 4, 0), animated: false)
        }
        else if curIndex == 5 {
            pageControl?.currentPage = 0
            scrollView.setContentOffset(CGPointMake(self.view.frame.width * 1, 0), animated: false)
        }
        else if curIndex != 0 && curIndex != 5 {
            pageControl?.currentPage = Int(curIndex) - 1
        }
        
    }
}

