module PhotoView exposing (..)
import Browser

import Types exposing ( Msg, Photo, Comment, examplePhoto)
import Html exposing (..)
import Html.Attributes exposing (..)

--type Msg = Nothing

type alias Model = 
    {photo : Photo}

init =
    { photo = examplePhoto }


photoView : Photo -> Html Msg -- type definition for Photo 
photoView photo =
    div [ class "photo" ] -- attribute <div class = "photo"> ..
        [ img [ src "first-test.png"] [] ]

view : Model -> Html Msg
view {photo} =
        div [ class "photo-view"]
            [ photoView photo]

update : Msg -> Model -> Model
update msg model =
    model
{--    case msg of
        NoOp ->
            ( model, Cmd.none )

        option1 ->
   --}                     
main = 
    Browser.sandbox { init = init, view = view, update = update}