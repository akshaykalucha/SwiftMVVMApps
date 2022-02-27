//
//  Global.swift
//  SwiftUI-MVVM
//
//  Created by Akshay Kalucha on 24/02/22.
//

import UIKit


enum Global {
    static var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    static var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    static var minDimension: CGFloat {
        min(screenWidth, screenHeight)
    }
    static var boardWidth: CGFloat {
        switch minDimension {
        case 0...320:
            return screenWidth-55
        case 321...430:
            return screenWidth-50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
    
    static var keyboardScale: CGFloat {
        switch minDimension {
        case 0...430:
            return screenWidth / 390
        case 431...1800:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
        }
    }
    
    static let commonWords = ["ABASE", "ABASH", "ABATE", "ABHOR", "ABIDE", "ABODE", "ABUSE", "ABYSS", "ACRID", "ACUTE", "ADAGE", "ADAPT", "ADDLE", "ADEPT", "ADORE", "ADORN", "AEGIS", "AERIE", "AFFIX", "AGAPE", "AGILE", "AGONY", "ALIAS", "ALIBI", "ALIGN", "ALLAY", "ALLOY", "ALOFT", "ALOOF", "AMASS", "AMBLE", "AMEND", "AMISS", "AMITY", "AMPLE", "AMUCK", "ANNEX", "ANNOY", "ANNUL", "ANTIC", "ANVIL", "ARBOR", "ARDOR", "ARGOT", "ARRAY", "ASHEN", "ASKEW", "ASSAY", "ASSET", "ATONE", "AUDIT", "AUGUR", "AVERT", "AWASH", "AWFUL", "AXIOM", "AZURE", "BADGE", "BALKY", "BALMY", "BANAL", "BANDY", "BAWDY", "BEGET", "BELIE", "BESET", "BIGOT", "BILGE", "BLAND", "BLARE", "BLASÉ", "BLAST", "BLEAK", "BLISS", "BLUFF", "BLUNT", "BLURB", "BLURT", "BLUSH", "BOGUS", "BONUS", "BOOST", "BOTCH", "BOUGH", "BOUND", "BRAID", "BRAKE", "BRAND", "BRASH", "BRASS", "BRAVE", "BRAWL", "BRAWN", "BREED", "BRIBE", "BRINK", "BRISK", "BROIL", "BROOD", "BROOK", "BRUIT", "BRUNT", "BUDGE", "BULGE", "BULLY", "BURLY", "BUXOM", "CABAL", "CACHE", "CADET", "CADGE", "CAMEO", "CANNY", "CANON", "CANTO", "CARAT", "CASTE", "CATER", "CAULK", "CAVIL", "CHAFE", "CHAFF", "CHANT", "CHARM", "CHARY", "CHASE", "CHASM", "CHECK", "CHIDE", "CHOIR", "CHOKE", "CHORD", "CHORE", "CHURL", "CIVIL", "CLASP", "CLEFT", "CLIME", "CLING", "CLOUT", "CLOWN", "COURT", "COVEN", "COWER", "COZEN", "CRAFT", "CRASS", "CRAVE", "CREDO", "CREED", "CREEK", "CREEP", "CREST", "CROCK", "CRONE", "CRONY", "CROON", "CROSS", "CROWN", "CRUDE", "CRUSH", "CRUST", "CRYPT", "CYNIC", "DALLY", "DANDY", "DAUNT", "DEBAR", "DEBUT", "DECOY", "DECRY", "DEFER", "DEIFY", "DEIGN", "DELTA", "DELVE", "DEMUR", "DETER", "DIGIT", "DINGY", "DIRGE", "DITCH", "DITTY", "DODGE", "DOGGO", "DOGMA", "DONOR", "DOUSE", "DOWDY", "DOWRY", "DOWSE", "DOYEN", "DRAFT", "DRAIN", "DRAMA", "DRAWL", "DREGS", "DROLL", "DRONE", "DROOP", "DROSS", "DUMMY", "DWARF", "EASEL", "ECLAT", "EDICT", "EDIFY", "EERIE", "ELATE", "ELEGY", "ELOPE", "EMBED", "EMEND", "EMOTE", "ENACT", "ENDUE", "ENNUI", "ENSUE", "ENTRY", "EPOCH", "ERECT", "ERODE", "ETHOS", "EVADE", "EVICT", "EVOKE", "EXACT", "EXALT", "EXERT", "EXTOL", "EXUDE", "EXULT", "FACET", "FAINT", "FANCY", "FARCE", "FAUNA", "FEIGN", "FEINT", "FELON", "FERAL", "FETID", "FIEND", "FILCH", "FILLY", "FILTH", "FINCH", "FLAIL", "FLAIR", "FLECK", "FLEET", "FLICK", "FLINT", "FLIRT", "FLOCK", "FLORA", "FLOUT", "FLUKE", "FLUSH", "FOIST", "FOLLY", "FORAY", "FORGE", "FORGO", "FORTE", "FORUM", "FRAIL", "FRISK", "FROCK", "FROND", "FUNGI", "FUROR", "FUSSY", "FUSTY", "GAFFE", "GAMUT", "GAUDY", "GAUGE", "GAUNT", "GAVEL", "GENRE", "GENUS", "GIDDY", "GIRTH", "GLADE", "GLARE", "GLAZE", "GLEAM", "GLEAN", "GLOAT", "GLOSS", "GNARL", "GNOME", "GORGE", "GOUGE", "GRACE", "GRANT", "GRATE", "GRAVE", "GRAZE", "GREEN", "GRILL", "GRIND", "GRIPE", "GROOM", "GROSS", "GROVE", "GROWL", "GRUEL", "GRUFF", "GRUNT", "GUILE", "GUILT", "GUISE", "GULLY", "GUSTO", "GUSTY", "HARDY", "HARRY", "HARSH", "HASTY", "HATCH", "HAUNT", "HAVEN", "HAVOC", "HEART", "HEDGE", "HOARD", "HOARY", "HORDE", "HOVEL", "HOVER", "HUMID", "HUMOR", "HUMUS", "HUSKY", "IDIOM", "IDYLL", "IMBUE", "IMPEL", "IMPLY", "INANE", "INCUR", "INEPT", "INERT", "INFER", "INTER", "INURE", "IRATE", "IRONY", "ISSUE"]
}

