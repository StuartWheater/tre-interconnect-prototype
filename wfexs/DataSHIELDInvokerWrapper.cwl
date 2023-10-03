# Common Workflow Language DataSHIELD Invoker Wrapper

cwlVersion: v1.2

class: Workflow

inputs:
    platformname:
        type: string
    profilename:
        type: string
    symbolnameslist:
        type: string
    tablenameslist:
        type: string
    workspacename:
        type: string
    rscript:
        type: string

outputs:
    response:
        type: File
        outputSource: invoker/invoker_response

steps:
    invoker:
        run: ./DataSHIELDInvoker.cwl

        in:
            platformname:    platformname
            profilename:     profilename
            symbolnameslist: symbolnameslist
            tablenameslist:  tablenameslist
            workspacename:   workspacename
            rscript:         rscript

        out: [ invoker_response ]
