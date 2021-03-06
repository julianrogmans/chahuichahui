module Routing exposing (..)

import Json.Decode as Decode
import Html exposing (Attribute)
import Html.Events exposing (onWithOptions)
import UrlParser exposing (return, apply, follow, path, apply, oneOf)


type Route
    = Home
    | Login
    | Register
    | NotFound


routes : UrlParser.Parser Route
routes =
    oneOf
        [ return Home
        , return Login |> follow (path "login")
        , return Register |> follow (path "signup")
        ]


onLinkClick : msg -> Attribute msg
onLinkClick message =
    let
        options =
            { stopPropagation = False
            , preventDefault = True
            }
    in
        onWithOptions "click" options (Decode.succeed message)
