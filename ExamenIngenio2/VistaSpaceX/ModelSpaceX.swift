//
//  ModelSpaceX.swift
//  ExamenIngenio2
//
//  Created by Victor Hugo Barajas Santibañez on 29/11/23.
//

import Foundation
import UIKit

struct ModelSpaceX : Codable{
  var flight_number : Int?
  var mission_name : String?
  var mission_id : [String]?
  var upcoming : Bool?
  var launch_year : String?
  var launch_date_unix : Int?
  var launch_date_utc : String?
  var launch_date_local : String?
  var is_tentative : Bool?
  var tentative_max_precision : String?
  var tbd : Bool?
  var launch_window : Int?
  var rocket : rocket?
  var ships : [String]?
  var telemetry : telemetry?
  var launch_site : launch_site?
  var launch_success : Bool?
  var links : links?
  var details : String?
  var static_fire_date_utc : String?
  var static_fire_date_unix : Int?
  var timeline : timeline?
  
}

struct rocket: Codable {
  var rocket_id : String?
  var rocket_name : String?
  var rocket_type : String?
  var first_stage : first_stage?
  var second_stage : second_stage?
  var fairings : fairings?
}

struct first_stage : Codable{
  var cores : [cores]?
}

struct cores : Codable{
  var core_serial : String?
  var flight : Int?
  var block : Int?
  var gridfins : Bool?
  var legs : Bool?
  var reused : Bool?
  var land_success : Bool?
  var landing_intent : Bool?
  var landing_type : String?
  var landing_vehicle : String?
}

struct second_stage : Codable{
  var block : Int?
  var payloads : [payloads]?
  
}

struct payloads : Codable{
  var payload_id : String?
  var norad_id : [Int]?
  var reused : Bool?
  var customers : [String]?
  var nationality : String?
  var manufacturer : String?
  var payload_type : String?
  var payload_mass_kg : Double?
  var payload_mass_lbs : Double?
  var orbit : String?
  var orbit_params : orbit_params?
}

struct orbit_params : Codable {
  var reference_system : String?
  var regime : String?
  var longitude : Double?
  var semi_major_axis_km : Double?
  var eccentricity : Double?
  var periapsis_km : Double?
  var apoapsis_km : Double?
  var inclination_deg : Double?
  var period_min : Double?
  var lifespan_years : Double?
  var epoch : String?
  var mean_motion : Double?
  var raan : Double?
  var arg_of_pericenter : Double?
  var mean_anomaly : Double?
}

struct fairings : Codable{
  var reused : Bool?
  var recovery_attempt : Bool?
  var recovered : Bool?
  var ship : String?
  
}

struct telemetry : Codable{
  var flight_club : String?
}

struct launch_site : Codable{
  var site_id : String?
  var site_name: String?
  var site_name_long : String?
}

struct links : Codable{
  var mission_patch : String?
  var mission_patch_small : String?
  var reddit_campaign : String?
  var reddit_launch : String?
  var reddit_recovery : String?
  var reddit_media : String?
  var presskit : String?
  var article_link : String?
  var wikipedia : String?
  var video_link : String?
  var youtube_id : String?
  var flickr_images : [String]?
}

struct timeline : Codable{
  var webcast_liftoff : Int?
  var go_for_prop_loading : Int?
  var rp1_loading : Int?
  var stage1_lox_loading : Int?
  var stage2_lox_loading : Int?
  var engine_chill : Int?
  var prelaunch_checks : Int?
  var propellant_pressurization : Int?
  var go_for_launch : Int?
  var ignition : Int?
  var liftoff : Int?
  var maxq : Int?
  var meco : Int?
  var stage_sep : Int?
  var second_stage_ignition : Int?
  var fairing_deploy : Int?
  var first_stage_boostback_burn : Int?
  var first_stage_entry_burn : Int?
  var second_stage_restart : Int?
  var payload_deploy : Int?
  
}
