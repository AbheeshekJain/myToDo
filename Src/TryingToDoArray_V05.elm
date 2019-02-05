import Browser 

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Array exposing (..)
import List exposing (..)


-- main : Html 
 
main =
    Browser.sandbox { init = init, view = view, update = update }

-- Model 

type alias Model =
  { task : String
  --, taskList: List String
  , taskAr: Array String -- added array as element of model
  , doneAr: Array String
  , len : Int
  , len2 : Int
  }

init =
  { task = ""
  --, taskList = []
  , taskAr = Array.fromList[] -- initialized array with
  , doneAr = Array.fromList[]
  , len = 0
  , len2 = 0
  }

-- for pupulating Donelist 
type alias Getitem = 
    { element : String
    , getAr : Array String
    }

-- no need to initialize 

type Msg
    = GetInput String
    | AddTask
    | RemoveBottom
    | RemoveTop
   

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
                    --taskList = model.taskList ++ [model.task]
                   taskAr = push model.task model.taskAr
                  , task = ""
                  
                } -- to add new task to the bottom of the List

        RemoveTop ->
            {
                model |
                    taskAr = removeArTop model.taskAr
                    
                    -- , doneAr = Array.push model.task model.doneAr-- need to fix this, as this is getting blanked task text and adding to the doneAr

            }
        -- if pressed "Remove Top" item, and add to Done List
        RemoveBottom ->
--            let
--                { theEle = removeEleBottom model.taskAr 
--               }
--           in
                {
                    model |
                        --taskAr = removeArrBottom model.taskAr
                        --, doneAr = Array.push Getitem. model.doneAr
                        --doneAr = push "test" model.doneAr -- pushes test as element to doneAr - ok 
                        doneAr = push (removeEleBottom model.taskAr) model.doneAr
                        -- the LAST ITEM from taskAr need to be pushed to doneAr
                }
        


-- view get and Array 

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo Try Array"]
        , input [placeholder "Enter your Task here", value model.task, onInput GetInput ] []
        , button [ onClick AddTask ] [ text "Add Task" ]
        , button [onClick RemoveTop] [text "Remove Top"]
        , button [ onClick RemoveBottom ] [ text "Remove Bottom" ]
        , h3 [] [text "TO DO"]
        , viewTaskList model
        , h3 [] [text "DONE"]
        , viewDoneTask model
        ]


-- creting list of html from strings from model using List.map  
viewDoneTask : Model -> Html Msg
viewDoneTask model =
    ul [] (List.map taskItemTohtml (getList model.doneAr))


viewTaskList : Model -> Html Msg
viewTaskList model = 
    ul [] (List.map taskItemTohtml (getList model.taskAr))

taskItemTohtml : String -> Html Msg
taskItemTohtml item = li [] [text item]

getList : Array a -> List a
getList taskList = toList (taskList)


{--
-- function to get the Array Cut
removeArBottom : Array a -> Model 
removeArBottom takeArray =
    let 
        lenAr = Array.length takeArray - 1
    in
       {
           getitem | getAr = slice 0 lenAr takeArray
           --, element = get 0 takeArray
       }
--}

removeEleBottom : Array String -> String
removeEleBottom takeArr =
    let 
        element : String
        element = ""
        lenAr = Array.length takeArr - 1
    in
       Maybe.withDefault element (get lenAr takeArr) -- worked to get the bottom element selected and added to DoneAr
       


{--
removeArrBottom : Array a -> Array a
removeArrBottom takeArr = 
    let 
        lenAr = Array.length takeArr - 1
    in
        {
            getAr = slice 0 lenAr takeArr
        }

--}



removeArTop : Array a -> Array a
removeArTop takeArray = 
    let
        lenAr = Array.length takeArray
    in
        slice 1 lenAr takeArray
       