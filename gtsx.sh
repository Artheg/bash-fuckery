#!/bin/sh

NAME=$1
CAPITALIZED_FIRST_CHAR="$(tr '[:lower:]' '[:upper:]' <<< ${NAME:0:1})${NAME:1}"
LOWERCASE_ALL=$(tr '[:upper:]' '[:lower:]' <<< ${NAME})
FILE="./$LOWERCASE_ALL.tsx"

if test -f "$FILE"; then
    echo "ERROR: $FILE exists, aborting"
    exit 1
fi

cat > $FILE <<-EOF
import React from "react";

type State = {};

type Props = {};

export default class $CAPITALIZED_FIRST_CHAR extends React.Component<Props, State>
{
    constructor(props) {
        super(props);
        this.state = {};
    }

    render()
    {
        return (<p>$CAPITALIZED_FIRST_CHAR</p>);
    }
}
EOF
echo "file $LOWERCASE_ALL.tsx was generated"