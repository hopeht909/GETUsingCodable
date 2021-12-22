//
//  ApiManager .swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import Foundation

class ApiManager {
    
    class func getApiResponse(urlPath: String, completionHandler: @escaping (Data?, Error?) -> Void ) {
        let urlSession = URLSession.shared
        guard let url = URL.init(string: urlPath) else { return }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
           
            if error != nil {
                completionHandler(nil, error)
            } else {
                completionHandler(data, nil)
            }
        }
        task.resume()
    }
}
