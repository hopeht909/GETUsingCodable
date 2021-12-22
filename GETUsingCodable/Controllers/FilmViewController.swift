//
//  ViewController.swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit

class FilmViewController: UITableViewController {

    let filmApi = "https://swapi.dev/api/films/"

    var film: Film?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFilmApi()
        tableView.rowHeight = 90
    }
    
    // MARK: Get Films Api
    func getFilmApi() {
           ApiManager.getApiResponse(urlPath: filmApi) { data, error in
               if error != nil {
                   print(error!.localizedDescription)
               } else {
                   
                   
                   
                   if let data = data,
                      let films = self.parseLogic(data: data) {
                       self.film = films
                       
                       DispatchQueue.main.async {
                           self.tableView.reloadData()
                       }
                   }
               }
           }
       }
    
    private func parseLogic(data:Data) -> Film? {
            do {
                let film = try JSONDecoder().decode(Film.self, from: data)
              //  print(filmArr.first?.title)
                return film
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }

    // MARK: UITableViewController
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return film?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        
        if let result = film?.results[indexPath.item] {
            cell.lblTitle.text = result.title
            cell.lblDirector.text = "Director: \(result.director)"
        }
        return cell
    }
}

