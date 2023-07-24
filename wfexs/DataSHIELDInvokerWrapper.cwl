# Common Workflow Language DataSHIELD Invoker

#cwlVersion: v1.2

# class: CommandLineTool
# baseCommand: echo

## The inputs for this process.
# inputs:
#  message:
#    type: string
#    default: "Hello World"
#    inputBinding:
#      position: 1
# outputs: []

cwlVersion: v1.2

class: Workflow
id: datashield_invoker
label: datashield_invoker

inputs:
    message:
        type: string

outputs:
    result_out:
        type: File
        outputSource: datashield/example_out

steps:
    datashield_invoker:
        run: ./DataSHIELDInvoker.cwl
        in:
            message: message
            
        out: [example_out]
