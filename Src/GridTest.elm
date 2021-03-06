module PhotoGrid exposing (..)
import Browser

import Types exposing (Photo, Comment, examplePhoto)

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)

type Msg = Nothing

-- define model type deifinition
type alias Model =
    { photos : List Photo }

init = 
    { photos = repeat 10 examplePhoto
    }

photoView : Photo -> Html Msg -- type definition for Photo 
photoView photo =
    div [ class "photo" ] -- attribute <div class = "photo"> ..
        [ img [ src "first-test.png"] [] ] -- attribute - tag <img src = "xyz" />


view : Model -> Html Msg -- type definition 
view model =
    div [class "photo-grid"] (List.map photoView model.photos)

update : Msg -> Model -> Model
update msg model =
    model

main =
    Browser.sandbox { init = init, view = view, update = update }
