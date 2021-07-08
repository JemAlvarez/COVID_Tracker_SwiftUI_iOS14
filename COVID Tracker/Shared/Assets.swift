struct Assets {
    // graphics
    enum Graphics {
        case washing
        case mask
        case old_man
        case online
        case sick
        case distancing
        case home
    }
    
    // icons
    enum Icons {
        case female
        case wash
        case male
        case sanitizer
        case virus
    }
    
    // colors
    enum Colors {
        case leafy
        case mint
        case mocha
        case skin
        case snow
    }
    
    // get graphics
    func getGraphic(_ graphic: Graphics) -> String {
        switch graphic {
        case .distancing:
            return "social_distancing"
        case .home:
            return "work_from_home"
        case .mask:
            return "lady_with_mask"
        case .old_man:
            return "old_man_winning_corona"
        case .online:
            return "online_consulting"
        case .sick:
            return "sick_person"
        case .washing:
            return "hand_washing"
        }
    }
    
    // get icons
    func getIcon(_ icons: Icons) -> String {
        switch icons {
        case .female:
            return "female"
        case .wash:
            return "wash"
        case .male:
            return "male"
        case .sanitizer:
            return "sanitizer"
        case .virus:
            return "virus"
        }
    }
    
    // get colors
    func getColor(_ colors: Colors) -> String {
        switch colors {
        case .skin:
            return "skin"
        case .snow:
            return "snow"
        case .mint:
            return "mint"
        case .leafy:
            return "leafy"
        case .mocha:
            return "mocha"
        }
    }
}
