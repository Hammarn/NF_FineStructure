#!/usr/bin nextflow



process split_command1{

    input:
    file command1 from command_file1
    output:
    file 'x*' into split_command1_output
    script:
    """
    split $command1 -l 1 -d 
    """
}


process one{


    input:
    file line from split_command1_output

    output:

    script:
    """
    module load bioinfo-tools
    module load fineSTRUCTURE
    bash $line
    """
