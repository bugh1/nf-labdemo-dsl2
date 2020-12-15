#!/usr/bin/env nextflow

nextflow.enable.dsl=2

params.alphabets = "$baseDir/input-alphabets.txt"
params.outdir = baseDir

log.info """\

     D E M O    P I P E L I N E
====================================
baseDir: ${baseDir}
alphabets: ${params.alphabets}
outdir: ${params.outdir}
"""

include { first_five; capitalize } from './processes'

workflow {
    // first_five(params.alphabets)
    // capitalize(first_five.out)
    first_five(params.alphabets) | capitalize
}