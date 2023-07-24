# Common Workflow Language DataSHIELD Invoker Wrapper

cwlVersion: v1.2

class: Workflow
id: datashield_invoker_wrapper
label: datashield_invoker_wrapper

inputs:
    message:
        type: string
        default: "Hello DataSHIELD"
        inputBinding:
             position: 1

outputs:
    result_out:
        type: File
        outputSource: datashield/example_out

steps:
    datashield_invoker:
        run: https://raw.githubusercontent.com/StuartWheater/tre-interconnect-prototype/with_wfexs/wfexs/DataSHIELDInvoker.cwl
        in:
            message: message
            
        out: [result_out]
