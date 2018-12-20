import Browser 
import Html exposing (Html, Attribute, div, input, button, text)
import Html.Events exposing (..)
import Html.Events exposing (onClick)
--import Html.Events exposing (onInput)
import Html.Attributes exposing (..)
import List

type alias Model =
  { content : String
  }
init =
  { content = "" }

type Msg
    = Submit
    --= Change String 

myList : a -> List a
myList value = 
    [ ]


--update : Msg -> showList 
update : Msg -> Model -> Model
update msg model =
    case msg of
        Submit ->
            { model | content = Elm.Kernel.List.cons }
            -- myList
            -- Elm.Kernel.List.cons
{--
func acc list =
  case list of
    [] ->
      acc
--}

{-- 
update msg Model =
    case msg of
        Submit ->
            myList
--}            

-- view showList =

view : Model -> Html Msg
view model =
    div []
        [ input [placeholder "Enter List Item", value model.content] []
        , button [ onClick Submit ] [ text "Submit" ]
        ]
    

-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }
    --span [ class "list-contents" ] [ text "test this" ]


