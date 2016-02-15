//
//  TimelineViewController.swift
//  carousel
//
//  Created by Jason Putorti on 2/14/16.
//  Copyright © 2016 Jason Putorti. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var timelineScroller: UIScrollView!
    @IBOutlet weak var timelineImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineScroller.delegate = self
        timelineScroller.contentSize = timelineImage.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
