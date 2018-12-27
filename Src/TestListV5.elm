import Browser 

-- import Html exposing (Html, Attribute, div, input, button, text, h1, ul)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Events exposing (onClick)
import Html.Events exposing (onInput)
import Html.Attributes exposing (..)
import List

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
            { model | 
                taskList = model.taskList ++ [model.content]
                , content = "" 
            } -- to add new task to the bottom of the List
            
        
-- view get and showList

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo List"]
        , input [placeholder "Enter your Task here", value model.content, onInput GetInput ] []
        , button [ onClick Submit ] [ text "Add Task" ]
        , viewTaskList model
       
        ]

-- hint  List.map model.taskList 

viewTaskList : Model -> Html Msg
viewTaskList model = 
    ol [] (List.map taskItemTohtml model.taskList)  

taskItemTohtml : String -> Html Msg
taskItemTohtml item = li [] [text item]



