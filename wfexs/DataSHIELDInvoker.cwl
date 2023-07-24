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

cwlVersion: v1.1

class: Workflow
id: hello_world
label: hello_world

inputs:
    message:
        type: string

outputs:
    example_out:
        type: File
        outputSource: hello_world/example_out

steps:
    hello_world:
        run: ./hello-world.cwl
        in:
            message: message
            
        out: [example_out]
