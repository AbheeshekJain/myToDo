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



{-- 
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
--import Html.App exposing (program)
import Http

main =
  -- Browser.sandbox { init = init, view = view, update = update}
  Browser.sandbox {init = init, view = view, update = update}

type Msg
  = NoOp
  | FetchSucceed (List User)
  | FetchError Http.Error
  | UpdateTitle String
  | SaveUser

init = { 
        users = []
        , isLoading = False
        , newUserTitle = Nothing 
        } -- /= [] -- ! []

type alias Model =
  { users : List User
  , isLoading : Bool
  , newUserTitle : Maybe String
  }

type alias User =
  { title : String
  , username : String
  , email : String
  }

update msg model =
  case msg of
     NoOp ->
       ( model, Cmd.none )

     FetchSucceed newModel ->
       ( { model | users = newModel, isLoading = False }, Cmd.none )

     FetchError _ ->
       ( { model | isLoading = False }, Cmd.none )

     UpdateTitle newTitle ->
       ( { model | newUserTitle = Just newTitle }, Cmd.none )
       
     SaveUser ->
       case model.newUserTitle of
         Nothing -> (model, Cmd.none)
         Just title ->
           ( { model
               | newUserTitle = Nothing
               , users = model.users ++ [{ title = title, username = "", email = "" }]
               }, Cmd.none)
       
view model =
  div []
    [ div [] (List.map displayRow model.users)
    , formCreateUser model
    ]

formCreateUser model =
  div []
    [ input [ onInput UpdateTitle, placeholder "Title", value (Maybe.withDefault "" model.newUserTitle) ] []
    , button [ onClick SaveUser ] [ text "Save" ]
    ]

displayRow {title} = div [] [ text title ]
--}