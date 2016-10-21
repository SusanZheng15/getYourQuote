//
//  ViewController.swift
//  getYourQuote
//
//  Created by Susan Zheng on 10/19/16.
//  Copyright © 2016 Susan Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var getRandomQuoteButton: UIButton!
    @IBOutlet weak var quotesTextView: UITextView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }


    @IBAction func getQuoteButton(_ sender: AnyObject)
    {
        APIClient.getQuote { (dictionary) in
            let quote = dictionary["quote"] as! String
            let author = dictionary["author"] as! String
            OperationQueue.main.addOperation({
                self.quotesTextView.text = quote
                self.authorLabel.text = author
            })
        }
    }

}

