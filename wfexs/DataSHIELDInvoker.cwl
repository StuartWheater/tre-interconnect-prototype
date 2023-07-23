# Common Workflow Language DataSHIELD Invoker

cwlVersion: v1.2

class: CommandLineTool
baseCommand: echo

# The inputs for this process.
inputs:
  message:
    type: string
    default: "Hello World"
    inputBinding:
      position: 1
outputs: []
