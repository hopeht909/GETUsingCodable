//
//  PhotosCollectionView.swift
//  GETUsingCodable
//
//  Created by admin on 18/05/1443 AH.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionView: UICollectionViewController {
    let photosApi = "https://jsonplaceholder.typicode.com/photos"
    var photosArr : [Photo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPhotosApi()
     
    }
    
    // MARK: Get Photos Api
    func getPhotosApi() {
            ApiManager.getApiResponse(urlPath: photosApi) { data, error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    if let data = data,
                       let photos = self.parseLogic(data: data) {
                        self.photosArr = photos
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
            }
        }
        
        private func parseLogic(data:Data) -> [Photo]? {
            do {
                let photosArr = try JSONDecoder().decode([Photo].self, from: data)
                
                return photosArr
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }

    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return photosArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        
        let photo = photosArr[indexPath.row]
        
        cell.imageView.kf.setImage(with: URL(string: photo.thumbnailUrl))
        cell.lblName.text = photo.title
    
    
    
        return cell
    }
}
