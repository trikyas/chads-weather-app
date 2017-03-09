import Vapor
import HTTP


let drop = Droplet()

let weather = WeatherController()
weather.addRoutes(drop: drop)

drop.get { request in
    let json = try drop.client.get("https://api.darksky.net/forecast/d265aa283801837f7e4d61f329a328fe/-31.916,152.457", query:
    ["exclude":"minutely,daily,alerts"])
    let body = try JSON(bytes: json.body.bytes!)

    let currently = body["currently"]! as JSON
    let hourly = body["hourly"]! as JSON

    return try drop.view.make("welcome", Node(node:
      [
        "time" : TimeKeeper().getSystemTime(),
        "temp" : currently["apparentTemperature"],
        "current-summary" : currently["summary"],
        "hourly-summary" : hourly["summary"],
        "icon" : currently["icon"]
      ]))
}



drop.run()
