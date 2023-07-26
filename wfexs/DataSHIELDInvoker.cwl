# Common Workflow Language DataSHIELD Invoker

cwlVersion: v1.2

class:       CommandLineTool
baseCommand: echo
stdout:      response.dat
stderr:      invoker.err

# The inputs for this process.
inputs:
    platformname:
        type: string
        default: "ionic"
        inputBinding:
            position: 1
    profilename:
        type: string
        default: "aqueduct"
        inputBinding:
            position: 2
    symbolnameslist:
        type: string
        default: "D"
        inputBinding:
            position: 3
    tablenameslist:
        type: string
        inputBinding:
            position: 4
    workspacename:
        type: string
        default: "ws"
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
