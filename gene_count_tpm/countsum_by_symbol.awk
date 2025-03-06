#!/usr/bin/awk -f

BEGIN {
    FS = OFS = "\t"
}

NR == 1 {      
    max_NF = NF
    print $0
    next
}


$2 != "NA" {
    key = $2
    if (!(key in first_line)) {
       first_line[key] = $1 
    }
    
    if (!(key in sums)) {
        for (i = 3; i <= NF; i++) {
            sums[key, i] = 0
        }
    }
    
    for (i = 3; i <= NF; i++) {
        sums[key, i] += $i + 0 
        }
    counts[key]++  
}


END {
    for (key in counts) {
        if (counts[key] > 1) {
            printf "consolidated\t%s", key
        } else {
            printf "%s\t%s", first_line[key], key 
        }
        for (i = 3; i <= max_NF; i++) {
            printf "\t%f", sums[key, i] 
        }
        printf "\n"
    }
}

