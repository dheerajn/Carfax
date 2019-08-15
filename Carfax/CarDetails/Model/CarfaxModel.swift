//
//  CarfaxModel.swift
//  Carfax
//
//  Created by Dheeru on 8/14/19.
//  Copyright © 2019 Dheeru. All rights reserved.
//

import Foundation

///This is the model calss for the complete Carfax

public struct CarFaxData: Codable {
    var backfillCount: Int?
    var breadCrumbs: [BreadCrumbs]?
    var dealerNewCount: Int?
    var dealerUsedCount: Int?
    var enhancedCount: Int?
    //    var facetCountMap: String? //Todo:
    var listings:[Listings]?
    var page: Int?
    var pageSize: Int?
    //    var relatedLinks: String? //TODO
    var searchArea: SearchArea?
    var searchRequest: SearchRequest?
    var seoUrl: String?
    var totalListingCount: Int?
    var totalPageCount: Int?
}

struct SearchRequest: Codable {
    var make: String?
    var mileageRange: MileageRange?
    var model: String?
    var priceRange: PriceRange
    var radius: Int?
    var srpUrl: String?
    var webHost: String?
    var yearRange: YearRange?
    var zip: String?
}

struct MileageRange: Codable {
    var max: Int?
    var min: Int?
}

struct PriceRange: Codable {
    var min: Int?
}

struct YearRange: Codable {
    var max: Int?
    var min: Int?
}

struct SearchArea: Codable {
    var city: String?
    var dynamicRadii: [Int]?
    var dynamicRadius: Bool?
    var latitude: Double?
    var longitude: Double?
    var radius: Int?
    var state: String?
    var zip: String?
}

struct BreadCrumbs: Codable {
    var label: String?
    var link: String?
    var position: Int?
}

struct Listings: Codable {
    var accidentHistory: AccidentHistory?
    var advantage: Bool?
    var backfill: Bool?
    var badge: String?
    var bedLength: String?
    var bodytype: String?
    var cabType: String?
    var certified: Bool
    var currentPrice: Int?
    var dealer: Dealer?
    var dealerType: String?
    var displacement: String?
    var distanceToDealer: Double?
    var drivetype: String?
    var engine: String?
    var exteriorColor: String?
    var firstSeen: String?
    var followCount: Int?
    var following: Bool?
    var fuel: String?
    var hasViewed: Bool?
    var id: String?
    var imageCount: Int?
    var images: CarImages?
    var interiorColor: String?
    var isEnriched: Bool?
    var listPrice: Int?
    var listingStatus: String?
    var make: String?
    var mileage: Int?
    var model: String?
    var monthlyPaymentEstimate: MonthlyPaymentEstimate?
    var mpgCity: Int?
    var mpgHighway: Int?
    var noAccidents: Bool?
    var oneOwner: Bool?
    var onePrice: Int?
    //    var onePriceArrows: Int? //TODO
    var onlineOnly: Bool?
    //    var ownerHistory: String? //TODO
    var personalUse: Bool?
    var recordType: String?
    var sentLead: Bool?
    //    var serviceHistory: String? //TODO
    var serviceRecords: Bool?
    var sortScore: Double?
    var stockNumber: String?
    var subTrim: String?
    var topOptions: [String]?
    var transmission: String?
    var trim: String?
    var vdpUrl: String?
    var vehicleCondition: String?
    var vehicleUseHistory: VehicleUseHistory?
    var vin: String?
    var year: Int?
}

struct VehicleUseHistory: Codable {
    var history: [VehicleHistory]?
    var icon: String?
    var iconUrl: String?
    var text: String?
}

struct VehicleHistory: Codable {
    var averageMilesPerYear: Int?
    var ownerNumber: Int?
    var useType: String?
}

struct AccidentHistory: Codable {
    var accidentSummary: [String]?
    var icon: String?
    var iconUrl: String?
    var text: String?
}

struct Dealer: Codable {
    var address: String?
    var carfaxId: String?
    var cfxMicrositeUrl: String?
    var city: String?
    var dealerAverageRating: Double?
    var dealerInventoryUrl: String?
    var dealerLeadType: String?
    var dealerReviewComments: String?
    var dealerReviewCount: Int?
    var dealerReviewDate: String?
    var dealerReviewRating: Int?
    var dealerReviewReviewer: String?
    var dealerReviewTitle: String?
    var latitude: String?
    var longitude: String?
    var name: String?
    var onlineOnly: Bool?
    var phone: String?
    var state: String?
    var zip: String?
}

struct CarImages: Codable {
    var baseUrl: String?
    var firstPhoto: ImageVariations?
    var large: [String]?
    var medium: [String]?
    var small: [String]?
}

struct ImageVariations: Codable {
    var large: String?
    var medium: String?
    var small: String?
}

struct MonthlyPaymentEstimate: Codable {
    var downPaymentAmount: Double?
    var downPaymentPercent: Int?
    var interestRate: Int?
    var loanAmount: Double?
    var monthlyPayment: Double?
    var price: Int?
    var termInMonths: Int?
}
