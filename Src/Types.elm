module Types exposing (..)
import List exposing (..)

type alias Photo = 
    { url : String
    , username :    String
    , location : String
    , likeCount : Int
    , commentCount : Int
    , comments : List Comment}

type alias Comment = 
    { username : String
    , message : String
    }

examplePhoto = 
    { url = "first-test.png"
    , username = "Jain"
    , location = "Bangkok"
    , likeCount = 100
    , commentCount = 20
    , comments = repeat 10 exampleComment
    }

exampleComment = 
    {
        username = "Person"
        , message = "Good Job!"
    }