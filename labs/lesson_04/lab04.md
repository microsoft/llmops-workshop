---
title: 'Lab 04: Monitoring'
layout: default
nav_order: 5
---
####  Monitoring

#### Prerequisites

An Azure subscription where you can create an AI Hub Resource and a AI Search service.

#### Setup

If you are running this Lab after lesson 1, you don't need to worry about this step.

Otherwise, follow **Setup** from **Lesson 1** to create a project and its associated resources in Azure AI Studio, as well as to deploy the GPT-4 model.

#### Lab Steps

In this Lab, you will execute the following steps:

1) Monitoring your LLMs flow.

2) Add Content Safety to your Solution.

##### 1) Monitoring your LLMs flow

Modify the output node of the workflow to incorporate the required information for computing the metrics that need monitoring, as outlined in the [User Experience](https://learn.microsoft.com/en-us/azure/ai-studio/how-to/monitor-quality-safety#user-experience) section of the Monitor Quality and Safety of Deployed Applications documentation. Be sure to activate monitoring by selecting the "Enable" button within the Model Monitoring section when deploying the workflow.

##### 2) Add Content Safety to your Solution

Create a basic flow from scratch (a simple Joke flow will be constructed).  
   
Make the following adjustments to the flow as per the instructions below:  
   
- Insert a [Content Safety tool](https://learn.microsoft.com/en-us/azure/machine-learning/prompt-flow/tools-reference/content-safety-text-tool) node between the input and the language model (LLM).  
   
- Add a Python node to process the output from the Content Safety tool and determine whether to proceed with the standard flow or not. For guidance on creating a conditional flow in Prompt Flow, refer to [this example](https://github.com/microsoft/promptflow/tree/main/examples/flows/standard/conditional-flow-for-if-else).  
   
- Add a Python node to craft a default response.  
   
- Implement conditions to trigger one response or another, depending on the Content Safety's result.  
   
- Develop a final node to compile and deliver the response to the user.