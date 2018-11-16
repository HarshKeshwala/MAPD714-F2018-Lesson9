import Foundation
import UIKit

class FavouritesList{
    
    public static let sharedFavouritesList = FavouritesList()
    private(set) var favourites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    func addFavourites(fontName: String) {
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    func removeFavourites(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    func saveFavourites(){
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
}
