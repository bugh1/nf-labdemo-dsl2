process first_five {
    input:
    path alphabets

    output:
    path "five.txt"

    """
    head -c 5 $alphabets > five.txt
    """
}

process capitalize {
    publishDir params.outdir, mode: 'copy'

    input:
    path five

    output:
    path "capitalized.txt"

    """
    tr a-z A-Z < $five > capitalized.txt
    """
}