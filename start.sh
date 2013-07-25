#!/bin/sh
erl -pa ebin deps/*/ebin -s hermod \
-eval "io:format(\"Get JSON: curl -i -H \\\"Accept: application/json\\\" http://localhost:8080/locations~n\")." \
-eval "io:format(\"Get 406: curl -i -H \\\"Accept: text/plain\\\" http://localhost:8080/locations~n\")."