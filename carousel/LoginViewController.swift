//
//  LoginViewController.swift
//  carousel
//
//  Created by Jason Putorti on 2/14/16.
//  Copyright © 2016 Jason Putorti. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var signInScroller: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var ajaxLoader: UIActivityIndicatorView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    let emptyAlert = UIAlertController(title: "Email Required", message: "Please enter your email address and password", preferredStyle: .Alert)
    let wrongAlert = UIAlertController(title: "Invalid Email or Password", message: "Your email address or password is incorrect, please try again", preferredStyle: .Alert)
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInScroller.delegate = self
        signInScroller.contentSize = signInScroller.frame.size
        signInScroller.contentInset.bottom = 100
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        emptyAlert.addAction(OKAction)
        wrongAlert.addAction(OKAction)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        signInScroller.contentOffset.y = signInScroller.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    @IBAction func signInButton(sender: AnyObject) {
        
        // Start animating the activity indicator
        ajaxLoader.startAnimating()
        
        // If both the email and password fields match what we are looking for...
        
        if emailField.text == "jason@me.com" && passwordField.text == "test" {
            
            // Delay for 2 seconds
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.ajaxLoader.stopAnimating()

                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("tutorialSegue", sender: nil)
            })
            
            // Otherwise, email or password are incorrect so...
  
        } else if emailField.text == "" || passwordField.text == "" {
            
            self.presentViewController(self.emptyAlert, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
            self.ajaxLoader.stopAnimating()
            self.signInButton.selected = false
            
        } else {
            // Delay for 2 second
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
                self.ajaxLoader.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.signInButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                
                self.presentViewController(self.wrongAlert, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            })
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
