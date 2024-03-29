/*
    Copyright (C) 2017 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A view controller that demonstrates how to use `UIButton`. The buttons are created using storyboards, but the attributed text button has its text set in code.
*/

import UIKit

class ButtonsViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var systemButton: UIButton!
    
    @IBOutlet weak var attributedTextButton: UIButton!
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        return [systemButton]
    }
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAttributedTextSystemButton()
    }
    
    // MARK: IB Actions
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        /*
            Clicking a button fires a UIControlEventPrimaryActionTriggered event.
            The buttons in this view controller have been setup in Interface Builder
            to call this action for the UIControlEventPrimaryActionTriggered event.
        */
        print("A button was clicked.")
    }
    
    // MARK: Convenience
    
    private func configureAttributedTextSystemButton() {
        let buttonTitle = NSLocalizedString("Button", comment: "")
        
        // Set the button's title for normal state.
        let normalTitleAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.blue,
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
        ]
        let normalAttributedTitle = NSAttributedString(string: buttonTitle, attributes: normalTitleAttributes)
        attributedTextButton.setAttributedTitle(normalAttributedTitle, for: UIControl.State())
        
        // Set the button's title for highlighted state.
        let highlightedTitleAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.green,
            NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.thick.rawValue
        ]
        let highlightedAttributedTitle = NSAttributedString(string: buttonTitle, attributes: highlightedTitleAttributes)
        attributedTextButton.setAttributedTitle(highlightedAttributedTitle, for: .highlighted)
    }
}
