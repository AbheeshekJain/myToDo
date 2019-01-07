import Browser 

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Array exposing (..)


-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }

-- Model 

type alias Model =
  { task : String
  , taskList: List String
  , taskAr: Array String -- added array as element of model
  , len : Int
  , len2 : Int
  }

init =
  { task = ""
  , taskList = []
  , taskAr = Array.fromList[] -- initialized array with
  , len = 0
  , len2 = 0
  }



type Msg
    = GetInput String
    | AddTask
    | RemoveBottom
   

--update : Msg -> showList 
update : Msg -> Model -> Model
update msg model =
    case msg of
        GetInput newtask ->
            { 
                model | 
                    task = newtask
            }
                   
        AddTask  ->
            -- to add new task on top of the List
            if model.task == "" then 
                model
                --checkEmpty model
            else
                { 
                 model | 
                     --checkEmpty model.content
                    taskList = model.taskList ++ [model.task]
                   , taskAr = push model.task model.taskAr
                   , task = ""
                   , len = length model.taskAr
                   --, len2 = model.len - 1
                   -- , len1 = List.length model.taskList + 1
                    -- , len2 = List.length model.taskList
                    -- just to check it received the item, doneList = model.doneList ++ [model.content]
                } -- to add new task to the bottom of the List

        -- if pressed "Remove Top" item, and add to Done List
        RemoveBottom ->
            {
                model |
                    --len = length model.taskAr
                    --, len2 = model.len - 1
                    taskAr = slice 0 model.len model.taskAr
            }
        
-- view get and showList

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo Try Array"]
        , input [placeholder "Enter your Task here", value model.task, onInput GetInput ] []
        , button [ onClick AddTask ] [ text "Add Task" ]
        , button [ onClick RemoveBottom ] [ text "Remove Task from Bottom " ]
        --, checkEmpty model
        --, showEmpty -- works checked if the function is called and shown correctly 
{--        , div[] 
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
        , viewDoneList model--}
        ]
