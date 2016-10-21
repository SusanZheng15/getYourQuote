//
//  APIClient.swift
//  getYourQuote
//
//  Created by Flatiron School on 10/19/16.
//  Copyright © 2016 Susan Zheng. All rights reserved.
//

import Foundation

class APIClient
{
    class func getQuote(completion: @escaping (NSDictionary)->())
    {
        let urlString = "http://quotes.stormconsultancy.co.uk/random.json"
        
        let url = URL(string: urlString)
        
        if let unwrappedURL = url
        {
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: unwrappedURL, completionHandler: { (data, response, error) in
                
                do{
                    guard let unwrappedData = data else {return}
                    let jsonDictionary = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! NSDictionary
                    
                    completion(jsonDictionary)
                }
                catch{
                    print("could not read api call")
                }
              
            })
            dataTask.resume()
            
        }

    }
}
