import Browser 

-- import Html exposing (Html, Attribute, div, input, button, text, h1, ul)
import Html exposing (..)
import Html.Events exposing (..)
--import Html.Events exposing (onClick)
--import Html.Events exposing (onInput)
import Html.Attributes exposing (..)
import List exposing (..)

-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }

-- Model 

type alias Model =
  { content : String
  , taskList: List String
  , doneList: List String
  , len1: Int
  , len2: Int
  }

init =
  { content = ""
  , taskList = []
  , doneList = []
  , len1 = 0
  , len2 = 0
  }


type Msg
    = GetInput String
    | AddTask
    | RemoveTop
    | RemoveBottom
    | ClearDone


--update : Msg -> showList 
update : Msg -> Model -> Model
update msg model =
    case msg of
        GetInput newListContent ->
            { 
                model | 
                    content = newListContent
            }
                   
        AddTask  ->
            -- to add new task on top of the List
            if model.content == "" then 
                model
                --checkEmpty model
            else
                { 
                 model | 
                     --checkEmpty model.content
                    taskList = model.taskList ++ [model.content]
                    , content = ""
                    , len1 = List.length model.taskList + 1
                    , len2 = List.length model.taskList
                    -- just to check it received the item, doneList = model.doneList ++ [model.content]
                } -- to add new task to the bottom of the List

        -- if pressed "Remove Top" item, and add to Done List
        RemoveTop ->
            {model | 
                doneList = model.doneList ++ take 1 model.taskList
                , taskList = drop 1 model.taskList
            }
        -- if pressed "Remove Bottom" item, and add to Done List
        RemoveBottom ->
            {
                model |
                    len1 = model.len1 - 1
                    --, len2 = model.len2 - 1
                    , len2 = model.len1 - 2
                    , doneList = model.doneList ++ drop model.len2 model.taskList --working 
                    , taskList = take model.len2 model.taskList -- now working
            }
            
        ClearDone ->
            {
                model| 
                    doneList = [] -- resetting the done list
            }


        
-- view get and showList

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo List Assignment"]
        , input [placeholder "Enter your Task here", value model.content, onInput GetInput ] []
        , button [ onClick AddTask ] [ text "Add Task" ]
        , checkEmpty model
        -- , showEmpty -- works checked if the function is called and shown correctly 
        , div[] 
            [ br [] []
            , button [ onClick RemoveTop ] [ text "Remove Task from Top " ]
            , span [] [text "  |  "]
            , button [ onClick RemoveBottom ] [ text "Remove Task from Bottom " ]
            , span [] [text "  |  "]
            , button [onClick ClearDone] [text "Clear Done Llist"]
            ]
        , h3 [] [text " - ToDo List - "]
        , viewTaskList model
        , h3 [] [text " - Done List - "]
        , viewDoneList model
        ]

-- creting list of html from strings from model using List.map  

viewTaskList : Model -> Html Msg
viewTaskList model = 
    --ol [] (List.map taskItemTohtml model.taskList)  -- this needs a function to be defined which will be passed to map on list
    ul [] (List.map taskItemTohtml model.taskList)  -- this needs a function to be defined which will be passed to map on list

taskItemTohtml : String -> Html Msg
taskItemTohtml item = li [] [text item]


-- view donelist items 
viewDoneList : Model -> Html Msg
viewDoneList model = 
    ol [] (List.map taskItemTohtml model.doneList)  -- this needs a function to be defined which will be passed to map on list
    
-- check empty string on submit
checkEmpty : Model -> Html msg
checkEmpty model = 
    if model.content == "" then
        div [style "color" "Red"] [text "Please enter some text here"]
    else
        div [] [text ""]

-- this is just to show a message on screen , to be called on submit
showEmpty : Html msg
showEmpty =
        div [style "color" "Red"] [text "Please enter some text"]
