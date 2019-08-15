//
//  CarfaxDetailsCellViewModel.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class CarfaxDetailsCellViewModel: DetailsTableViewCellConfigurable, AlertViewPresentable {
    
    fileprivate var callbuttonTextLocal: String?
    fileprivate var location: Dealer?
    
    init(year: Int?, make: String, model: String, trim: String?, mileage: Int?, price: Int?, callButtonText: String?, imageUrl: String?, location: Dealer?) {
        self.yearMakeModelText = String(year ?? 0) + " " + make + " " + model
        self.trimText = "Trim: " + (trim ?? "Not Available")
        self.mileageText = "Mileage: " + String(mileage ?? 0)
        self.priceText = "Price: " + String(price ?? 0)
        self.callbuttonTextLocal = callButtonText
        self.imageUrl = imageUrl
        
        self.location = location
        var address = location?.address ?? ""
        address = address.isEmpty == false ? (address + ", ") : address
        
        var city = location?.city ?? ""
        city = city.isEmpty == false ? (city + ", ") : city

        let state = location?.state ?? ""
        
        let formattedLocation = address + city + state
        self.locationText = formattedLocation
    }
    
    var yearMakeModelText: String?
    var trimText: String?
    var mileageText: String?
    var priceText: String?
    var locationText: String?
    var imageUrl: String?
    
    var callButtonText: String? {
        let num = self.callbuttonTextLocal
        return num?.asPhoneNumber
    }
    
    func callButtonAction() {
        guard let validNumber = self.callButtonText?.onlyNumbers, let url = URL(string: "tel://\(validNumber)") else { return }
        if UIApplication.shared.canOpenURL(url) == true {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func locationButtonTapped() {
        guard let validLat = self.location?.latitude,
            let validLong = self.location?.longitude,
            let doublelat = Double(validLat),
            let doublelng = Double(validLong),
            let lat = CLLocationDegrees(exactly: doublelat),
            let lng = CLLocationDegrees(exactly: doublelng) else { return }
        
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        destination.name = self.location?.name
        
        
        let okAction: CustomAlertAction = (title: "OK", style: UIAlertAction.Style.default, handler: {
            MKMapItem.openMaps(with: [destination],
                               launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDefault])
        })
        let cancelAction: CustomAlertAction = (title: "CANCEL", style: UIAlertAction.Style.default, handler: nil)

        self.displayAlertWithTitle("You are about to leave the app. Are you fine with this?",
                                   message: "We will route you to Maps to show you the location of the dealer you selected.", andActions: [okAction, cancelAction])
    }
}
