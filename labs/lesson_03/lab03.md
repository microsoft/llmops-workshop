#### Evaluating and Deploying LLMs

In this Lab, you will execute the following steps:

1) Create an evaluation flow.

2) Deploy the flow to an online managed endpoint.


#### Setup: Create a project in Azure AI Studio.

If you have already completed the Lab from lesson 1, you don't need to worry about this step.

Otherwise, simply execute step 1 of lesson 1, which is to create a project in Azure AI Studio.

In addition to creating the project, it will also be necessary to create a deployment for a gpt-4 model to run the evaluation flow.

#### 1) Create an evaluation flow

Go to your browser and type: https://ai.azure.com

Enter the Build menu and then select the Prompt flow option and click on the blue Create button.

![LLMOps Workshop](images/05.01.2024_00.43.51_REC.png)

Select the **Evaluation Flow** filter and then **QnA RAG Evaluation**.

![LLMOps Workshop](images/05.01.2024_00.44.47_REC.png)

Clone the flow.

![LLMOps Workshop](images/05.01.2024_00.45.50_REC.png)

A flow will be created with the following structure:

![LLMOps Workshop](images/05.01.2024_00.47.44_REC.png)

Update the Connection field to point to a gpt-4 deployment in each LLM node.  
   
For example:

![LLMOps Workshop](images/05.01.2024_00.49.06_REC.png)

In the Flows section of Prompt Flow, open the **Multi-Round Q&A on Your Data** flow that you created in the previous lab. This will be the flow we use for evaluation.

![LLMOps Workshop](images/05.01.2024_00.55.56_REC.png)

Add a new output to the flow with the documents obtained from retrieval.

![LLMOps Workshop](images/05.01.2024_01.07.52_REC.png)

This flow output should correspond to the output of the node that performs the search.

![LLMOps Workshop](images/05.01.2024_01.10.25_REC.png)

Select the **Custom evaluation** option in the Evaluate menu.

![LLMOps Workshop](images/05.01.2024_01.31.10_REC.png)

Select to test with all prompt variants.

![LLMOps Workshop](images/05.01.2024_01.35.13_REC.png)

Upload the file data.csv inside the lesson_03 folder, and then proceed to map the input fields as shown below: 

![LLMOps Workshop](images/05.01.2024_01.36.19_REC.png)

Select the evaluation flow initially created.

![LLMOps Workshop](images/05.01.2024_01.37.19_REC.png)

Configure the fields to be used during the evaluation.

![LLMOps Workshop](images/05.01.2024_01.43.23_REC.png)

Click on Submit.

![LLMOps Workshop](images/05.01.2024_01.44.01_REC.png)

Great! The evaluation of the flow has been initialized. Next, click on the **Evaluation** section in the **Build** tab to analyze the results.

#### 2) Deploy the flow to an online managed endpoint.

For this step, let's follow the instructions indicated in this link:

https://learn.microsoft.com/en-us/azure/ai-studio/how-to/flow-deploy