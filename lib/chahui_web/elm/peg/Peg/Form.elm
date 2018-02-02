module Peg.Form exposing (..)


type FormState
    = FormState
        { fields : Dict String String
        , validations : Dict String (Maybe (List Validation))
        , errors : Dict String (Maybe (List String))
        }


type alias Validation =
    String -> String


type alias Field =
    ( String
    , { default : String
      , validations : Maybe (List Validation)
      }
    )


init : List Field -> FormState



-- init fields =
