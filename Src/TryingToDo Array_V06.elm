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
  }

init =
  { task = ""
  , taskAr = Array.fromList[] -- initialized array with
  , doneAr = Array.fromList[]
  }

{-- 
-- for pupulating Donelist 
type alias Getitem = 
    { element : String
    , getAr : Array String
    }
-- no need to initialize 

-- this is unused, BUT I would get to it in next version
--}


type Msg
    = GetInput String
    | AddTask
    | RemoveBottom
    | RemoveTop
    | ClearDone
   

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
            else
                { 
                 model | 
                   taskAr = push model.task model.taskAr
                  , task = ""
                  
                } -- to add new task to the bottom of the List

        RemoveTop ->
            if getEleTop model.taskAr == "" then 
                model
            else
            {
                model |
                    taskAr = removeArTop model.taskAr
                    -- , doneAr = Array.push model.task model.doneAr-- need to fix this, as this is getting blanked task text and adding to the doneAr
                    , doneAr = push (getEleTop model.taskAr) model.doneAr
                    

            }
        -- if pressed "Remove Top" item, and add to Done List
        RemoveBottom ->
            if getEleBottom model.taskAr == "" then 
                model
            else
                {
                    model |
                        taskAr = removeArrBottom model.taskAr
                        --doneAr = push "test" model.doneAr -- pushes test as element to doneAr - ok 
                        , doneAr = push (getEleBottom model.taskAr) model.doneAr
                        -- the LAST ITEM from taskAr need to be pushed to doneAr
                }
        ClearDone ->
            {
                model| 
                    doneAr = Array.fromList[] -- resetting the done Array
            }
        

-- view get and Array 

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [text "myToDo [Try Array after doing the same with List]"]
        , input [placeholder "Enter your Task here", value model.task, onInput GetInput ] []
        , checkEmpty model
        , button [ onClick AddTask ] [ text "Add Task Button" ]
        , button [onClick RemoveTop] [text "Remove From Top"]
        , button [ onClick RemoveBottom ] [ text "Remove From Bottom" ]
        , button [ onClick ClearDone] [text "Clear Done List"]
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


getEleBottom : Array String -> String
getEleBottom takeArr =
    let 
        --element : String -- see comment in the getEleTop function 
        --element = ""
        lenAr = Array.length takeArr - 1
    in
       Maybe.withDefault "" (get lenAr takeArr) -- worked to get the bottom element tobe  selected and added to DoneAr
       
getEleTop : Array String -> String
getEleTop takeArr =
{-- replacing this with Empty string as we need to for Just value, 
    but in this case we need to get 'actual value from Maybe   
    and this Empty is been handled with a separate function, 
    as it was showing a empty bullet item when directly pressed either "Remove" buttons
    
    let 
        element : String
        element = ""
    in--}
       Maybe.withDefault "" (get 0 takeArr) -- worked to get the top element tobe selected and added to DoneAr


removeArrBottom : Array a -> Array a
removeArrBottom takeArr = 
    let 
        lenAr = Array.length takeArr - 1
    in
        slice 0 lenAr takeArr


removeArTop : Array a -> Array a
removeArTop takeArray = 
    let
        lenAr = Array.length takeArray
    in
        slice 1 lenAr takeArray


-- check empty string on submit
checkEmpty : Model -> Html msg
checkEmpty model = 
    if model.task == "" then
        div [style "color" "Red"] [text "Please enter some text here"]
    else
        div [style "color" "Green"] [text "Text Entered"]