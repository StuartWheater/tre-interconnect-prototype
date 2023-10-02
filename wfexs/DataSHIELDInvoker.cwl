# Common Workflow Language DataSHIELD Invoker

cwlVersion: v1.2

class:       CommandLineTool
baseCommand: [java, --jar, anal-datashield-invoker-run.jar]
stdout:      response.out
stderr:      invoker.err

# The inputs for this process.
inputs:
    platformname:
        type: string
        inputBinding:
            position: 1
    profilename:
        type: string
        inputBinding:
            position: 2
    symbolnameslist:
        type: string
        inputBinding:
            position: 3
    tablenameslist:
        type: string
        inputBinding:
            position: 4
    workspacename:
        type: string
        inputBinding:
            position: 5
    rscript:
        type: string
        inputBinding:
            position: 6

# The outputs for this process.
outputs:
    response:
        type: stdout
