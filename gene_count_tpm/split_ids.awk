#! /usr/bin/awk -f

BEGIN {
    FS = ","
    OFS = "\t"
}

{
    split($1, a, "|")
    
    if (a[2] == "") a[2] = "NA"
    
    $1 = a[1] "\t" a[2]
    print
}



