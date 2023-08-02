#!/bin/bash
            #$ -S /bin/bash
            argc=$#
            requiredArgc=0
            if [ $argc -ne $requiredArgc ]; then
            echo './test_mkdir.sh'
            exit 1
            fi
            
            prefixInFiles=D_sam_to_bam
suffixInFiles=.sub
for (( i = 1; i <= 31 ; i++ )); do 
            # keep track of what is going on...
            echo 'Treating file'  $prefixInFiles$i$suffixInFiles
            # define a script name that will be submited to the queue
            qsubFile=$prefixInFiles$i$suffixInFiles
            # make the script executable
            chmod a+x $qsubFile
            # submit the script to the queue
            qsub -cwd $qsubFile
            done