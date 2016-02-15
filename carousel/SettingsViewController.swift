//
//  SettingsViewController.swift
//  carousel
//
//  Created by Jason Putorti on 2/14/16.
//  Copyright © 2016 Jason Putorti. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var settingsScroller: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    let signOutConfirm = UIAlertController(title: "Are you sure you want to sign out?", message: "", preferredStyle: .ActionSheet)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScroller.delegate = self
        settingsScroller.contentSize = settingsImage.image!.size
        
        let signoutAction = UIAlertAction(title: "Sign Out", style: .Destructive) { (action) in
            // handle case of user logging out
            self.performSegueWithIdentifier("signoutSegue", sender: nil)
        }
        // add the logout action to the alert controller
        signOutConfirm.addAction(signoutAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle case of user canceling. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alert controller
        signOutConfirm.addAction(cancelAction)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modalClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func signoutButton(sender: AnyObject) {
        presentViewController(signOutConfirm, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
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
