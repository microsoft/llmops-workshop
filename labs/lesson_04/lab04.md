####  Monitoring

In this Lab, you will execute the following steps:

1) Monitoring your LLMs flow.

2) Add Content Safety to your Solution.

#### 1) Monitoring your LLMs flow.

Adjust the output node of the flow to include the necessary information for calculating the metrics to be monitored.  
   
Then, in the flow deployment, enable monitoring by clicking on the Enable button in the Model monitoring section.

Reference:
- https://learn.microsoft.com/en-us/azure/ai-studio/how-to/monitor-quality-safety
- https://learn.microsoft.com/en-us/azure/machine-learning/prompt-flow/how-to-monitor-generative-ai-applications

#### 2) Add Content Safety to your Solution.

Create a standard flow (Joke).  
   
Add a Content Safety tool node between the input and the llm.  
   
Add a Python node to process the output of the Content Safety and indicate whether to continue with the standard flow or not.  
   
Add a Python node to generate a default response.  
   
Add conditions to activate one response or another based on the result of the Content Safety.  
   
Create a final node to consolidate the response for the user.

References:
- https://learn.microsoft.com/en-us/azure/machine-learning/prompt-flow/tools-reference/content-safety-text-tool
- https://github.com/microsoft/promptflow/tree/main/examples/flows/standard/conditional-flow-for-if-else