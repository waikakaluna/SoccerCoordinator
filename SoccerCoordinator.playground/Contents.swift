//SoccerCoordinator Final

/***********************
 Part 1: Player Database
 ***********************/

let player1: [String: Any] = ["name": "Joe Smith", "height": 42.0, "hasExperience": true, "guardianName": "Jim and Jan Smith"]
let player2: [String: Any] = ["name": "Jill Tanner", "height": 36.0, "hasExperience": true, "guardianName": "Clara Tanner"]
let player3: [String: Any] = ["name": "Bill Bon", "height": 43.0, "hasExperience": true, "guardianName": "Sara and Jenny Bon"]
let player4: [String: Any] = ["name": "Eva Gordon", "height": 45.0, "hasExperience": false, "guardianName": "Wendy and Mike Gordon"]
let player5: [String: Any] = ["name": "Matt Gill", "height": 40.0, "hasExperience": false, "guardianName": "Charles and Sylvia Gill"]
let player6: [String: Any] = ["name": "Kimmy Stein", "height": 41.0, "hasExperience": false, "guardianName": "Bill and Hillary Stein"]
let player7: [String: Any] = ["name": "Sammy Adams", "height": 45.0, "hasExperience": false, "guardianName": "Jeff Adams"]
let player8: [String: Any] = ["name": "Karl Saygan", "height": 42.0, "hasExperience": true, "guardianName": "Heather Bledsoe"]
let player9: [String: Any] = ["name": "Suzane Greenberg", "height": 44.0, "hasExperience": true, "guardianName": "Henrietta Dumas"]
let player10: [String: Any] = ["name": "Sal Dali", "height": 41.0, "hasExperience": false, "guardianName": "Gala Dali"]
let player11: [String: Any] = ["name": "Joe Kavalier", "height": 39.0, "hasExperience": false, "guardianName": "Sam and Elaine Kavalier"]
let player12: [String: Any] = ["name": "Ben Finkelstein", "height": 44.0, "hasExperience": false, "guardianName": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = ["name": "Diego Soto", "height": 41.0, "hasExperience": true, "guardianName": "Robin and Sarika Soto"]
let player14: [String: Any] = ["name": "Chloe Alaska", "height": 47.0, "hasExperience": false, "guardianName": "David and Jamie Alaska"]
let player15: [String: Any] = ["name": "Arnold Willis", "height": 43.0, "hasExperience": false, "guardianName": "Claire Willis"]
let player16: [String: Any] = ["name": "Philip Helm", "height": 44.0, "hasExperience": true, "guardianName": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = ["name": "Les Clay", "height": 42.0, "hasExperience": true, "guardianName": "Wynonna Brown"]
let player18: [String: Any] = ["name": "Herschel Krustofski", "height": 45.0, "hasExperience": true, "guardianName": "Hyman and Rachel Krustofski"]


//Storing the players
let roster: [[String:Any]] = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]


//Sorting Collections
var experiencedPlayers: [[String : Any]] = []
var newbiePlayers: [[String : Any]] = []
var sortedRoster: [[String : Any]] = []


//Team Collections
var teamDragons: [[String : Any]] = []
var teamSharks: [[String : Any]] = []
var teamRaptors: [[String : Any]] = []
var letters:[String] = []


/***********************
 Part 2: Sorting Logics
 ***********************/

func sortRoster(players:[[String:Any]]){
    for playerName in players {
        if playerName["hasExperience"] as! Bool == true {
            experiencedPlayers.append(playerName)
        } else {
            newbiePlayers.append(playerName)
        }
    }
}

func appendToSortedRoster(players:[[String:Any]]){
    for playerName in players {
        sortedRoster.append(playerName)
    }
}

func sortTeams(players:[[String:Any]]){
    for playerName in players{
        if teamDragons.count < teamSharks.count {
            teamDragons.append(playerName)
        } else if teamSharks.count < teamRaptors.count{
            teamSharks.append(playerName)
        } else {
            teamRaptors.append(playerName
            )
        }
    }
}

func averageHeight(players:[[String:Any]])-> Double {
    var heightTotal: Double = 0
    
    for playerName in players {
        heightTotal += playerName["height"] as! Double
    }
    
    let average: Double = heightTotal / Double(players.count)
    return average
}


//Separate by experience
sortRoster(players: roster)


//Separate by height
experiencedPlayers.sort{(($0 as Dictionary<String, AnyObject>)["height"] as! Double) > (($1 as Dictionary<String, AnyObject>)["height"] as! Double)}
newbiePlayers.sort{(($0 as Dictionary<String, AnyObject>)["height"] as! Double) < (($1 as Dictionary<String, AnyObject>)["height"] as! Double)}


//Create a final sorted collection
appendToSortedRoster(players: experiencedPlayers)
appendToSortedRoster(players: newbiePlayers)


//Break up the roster into teams
sortTeams(players: sortedRoster)


//Displaying the average height of each team.  Allowed 1.5 difference between each team
print(averageHeight(players: teamDragons))
print(averageHeight(players: teamSharks))
print(averageHeight(players: teamRaptors))



/***************************
 Part 3: Letter to Guardians
 ***************************/

func writeDragonLetters(){
    
    for playerName in teamDragons {
        let practice = "March 17, @ 1pm"
        let letter = "Dear \(playerName["guardianName"] as! String ), \(playerName["name"] as! String) has been selected to join Team Dragons!  Practice will begin \(practice)."
        letters.append(letter)
        print(letter)
    }
}

func writeSharkLetters(){
    
    for playerName in teamSharks{
        let practice = "March 17, @ 3pm"
        let letter = "Dear \(playerName["guardianName"] as! String ), \(playerName["name"] as! String) has been selected to join Team Sharks!  Practice will begin \(practice)."
        letters.append(letter)
        print(letter)
    }
}

func writeRaptorLetters(){
    
    for playerName in teamRaptors{
        let practice = "March 18, @ 1pm"
        let letter = "Dear \(playerName["guardianName"] as! String ), \(playerName["name"] as! String) has been selected to join Team Raptors!  Practice will begin \(practice)."
        letters.append(letter)
        print(letter)
    }
}

//Write and store the letters to be mailed to guardians
writeDragonLetters()
writeSharkLetters()
writeRaptorLetters()


//Print out the letters collection if necessary
//print(letters)
