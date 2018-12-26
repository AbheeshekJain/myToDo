import Browser 

import Html exposing (Html, Attribute, div, input, button, text, h1)
import Html.Events exposing (..)
import Html.Events exposing (onClick)
import Html.Events exposing (onInput)
import Html.Attributes exposing (..)


-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }

-- Model 

type alias Model =
  { content : String
  , taskList: List String
  }

init =
  { content = ""
  , taskList = []
  }


type Msg
    = GetInput String
    | Submit


--update : Msg -> showList 
update : Msg -> Model -> Model
update msg model =
    case msg of
        GetInput newListContent ->
            { model | content = newListContent }
                   
        Submit  ->
            --{ model | taskList = model.content :: model.taskList} -- to add new task on top of the List
            { model | taskList = model.taskList ++ [model.content] } -- to add new task to the bottom of the List
            
        
-- view get and showList

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo List"]
        , input [placeholder "Enter your Task here", value model.content, onInput GetInput ] []
        , button [ onClick Submit ] [ text "Add Task" ]
        ]

-- Next would be getting the list and displaying on the screen 

{-- make with 
elm make --debug Z:/ELM101/ElmFiles/elm-architecture-tutorial/examples/TestListV4.elm --output=examples/TestListV4.html

Open the .html file and see the debugger working with browser
--}