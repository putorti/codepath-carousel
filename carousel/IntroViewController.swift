//
//  IntroViewController.swift
//  carousel
//
//  Created by Jason Putorti on 2/14/16.
//  Copyright © 2016 Jason Putorti. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScroller: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        introScroller.delegate = self
        introScroller.contentSize = introImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(introScroller: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(introScroller: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(introScroller: UIScrollView,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(introScroller: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
