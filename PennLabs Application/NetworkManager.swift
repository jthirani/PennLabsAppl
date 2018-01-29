//
//  NetworkManager.swift
//  PennLabs Application
//
//  Created by Jai Thirani on 1/27/18.
//  Copyright © 2018 Jai Thirani. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    static func getData()  {
        Alamofire.request("https://api.pennlabs.org/dining/venues").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
                let j = JSON(json)
                print(j["document"]["venue"].count)
                var vs = [JSON]()
                for v in j["document"]["venue"] {
                    vs.append(JSON(v.1))
                }
                //Did get the names and URLs
                print(vs[0]["name"])
                print(vs[0]["dailyMenuURL"])
            }
        }
    }
}
