import Browser 

import Html exposing (Html, Attribute, div, input, button, text)
import Html.Events exposing (..)
import Html.Events exposing (onClick)
import Html.Events exposing (onInput)
import Html.Attributes exposing (..)
import List
import Dict

-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }
    


type alias Model =
  { content : String
  }

init =
  { content = "Task1" }


type Msg
    = Submit


-- Change String 

myList : a -> List a
myList value = 
    []

--update : Msg -> showList 
update : Msg -> Model -> Model
update msg model =
    case msg of
        Submit ->
            --{ model | content = Elm.Kernel.List.cons }
            { model | content = model.content } 
            -- myList         
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
        [ input [placeholder "Enter TaskList Item", value model.content] []
        , button [ onClick Submit ] [ text "Submit" ]
        --, addEntry -- will list out the entries
        , div[] [text "This is the list"]
        , div [] [text model.content]
        --, div [] [text myList]
        ]

{--
-- testing only list 
addEntry : Html Msg
addEntry =
  select
    [onCLick Submit]
    (List.map simpleOption content)


meSelect: List String
meSelect=
    ["task1"
    , "task2"
    ,"task3"
    ]

--}




