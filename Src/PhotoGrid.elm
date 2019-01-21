module PhotoGrid exposing (..)
import Browser

import Types exposing (Msg, Photo, Comment, examplePhoto)
import PhotoView exposing (photoView)

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (..)

--type Msg = Nothing

-- define model type deifinition
type alias Model =
    { photos : List Photo }

init = 
    { photos = repeat 10 examplePhoto
    }

-- photoView moved to PhotoView

photoGridView : List Photo -> Html Msg -- type definition for Photo 
photoGridView photos =
    div [class "photo-grid"]
        (List.map photoView photos)

view : Model -> Html Msg -- type definition 
view model =
    --div [class "photo-grid"] (List.map photoView model.photos)
    photoGridView model.photos

update : Msg -> Model -> Model
update msg model =
    model

main =
    Browser.sandbox { init = init, view = view, update = update }
