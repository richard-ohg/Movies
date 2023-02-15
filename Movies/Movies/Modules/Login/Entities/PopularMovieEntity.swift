//
//  PopularMovieEntity.swift
//  Movies
//
//  Created by Ricardo Omar Hernández on 15/02/23.
//

import Foundation

//{
//    "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
//    "adult": false,
//    "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
//    "release_date": "2016-08-03",
//    "genre_ids": [
//        14,
//        28,
//        80
//    ],
//    "id": 297761,
//    "original_title": "Suicide Squad",
//    "original_language": "en",
//    "title": "Suicide Squad",
//    "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
//    "popularity": 48.261451,
//    "vote_count": 1466,
//    "video": false,
//    "vote_average": 5.91
//}

struct PopularMovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageUrl: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageUrl = "poster_path"
        case votes = "vote_average"
    }
}
