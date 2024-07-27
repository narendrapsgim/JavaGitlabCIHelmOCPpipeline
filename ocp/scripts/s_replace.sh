#!/bin/bash

# sed common function
s_replace() { 
sed -i "s/$1/$2/g" "$3" 
}
