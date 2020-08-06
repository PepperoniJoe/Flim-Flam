//
//  RootViewController.swift
//  FlimFlam
//
//  Created by Marcy Vernon on 10/31/18.
//  Copyright © 2018 Marcy Vernon. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var pageViewController = UIPageViewController()
    var modelController    = ModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupPageViews()
    }
    
    
    func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .pageCurl,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        pageViewController.delegate = self
        
        let storyboard = self.storyboard != nil ? self.storyboard! : UIStoryboard()
        
        if let dataViewController = modelController.viewControllerAtIndex(0, storyboard: storyboard) {
            let startingViewController: DataViewController = dataViewController
            let viewControllers = [startingViewController]
            pageViewController.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        }
        
        pageViewController.dataSource = modelController
        self.view.addSubview(pageViewController.view)
    }
    
    
    func setupPageViews() {
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        pageViewController.view.frame = pageViewRect
        pageViewController.didMove(toParent: self)
    }
}  // end of RootViewController


// MARK: - UIPageViewControllerDelegate
extension RootViewController: UIPageViewControllerDelegate {

    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        
            let currentViewController = pageViewController.viewControllers?[0] ?? UIViewController()
            let currentViewControllers = [currentViewController]
            
            pageViewController.setViewControllers(currentViewControllers,
                                                  direction  : .forward,
                                                  animated   : true,
                                                  completion : { done in })
            
            pageViewController.isDoubleSided = false
            return .min

    }
}

