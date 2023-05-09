//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by murad on 08.05.2023.
//

import UIKit

/// Controller to show and search for Characters 
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        //print(request.url ?? "error")
        
        RMService.shared.execute(.listCaharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                //print(String(describing: model))
                print("Total: "+String(model.info.count))
                print("Page result count: "+String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
            
        }
    }
    
}
