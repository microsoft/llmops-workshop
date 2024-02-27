#### Evaluating and Deploying LLMs

In this Lab, you will execute the following steps:

1) Create an evaluation flow.

2) Deploy the RAG flow to an online managed endpoint.


#### Setup: Create a project in Azure AI Studio.

If you have already completed the Lab from lesson 1, you don't need to worry about this step.

Otherwise, simply execute step 1 of lesson 1, which is to create a project in Azure AI Studio.

In addition to creating the project, it will also be necessary to create a deployment for a gpt-4 model to run the evaluation flow.

#### 1) Create an evaluation flow

Go to your browser and type: https://ai.azure.com

Enter the Build menu and then select the Prompt flow option and click on the blue **Create** button.

![LLMOps Workshop](images/05.01.2024_00.43.51_REC.png)

Select the **Evaluation Flow** filter and then **QnA Groundedness Evaluation**.

> Note: you may need to click **View more samples** to find the QnA Groundedness Evaluation template.

![LLMOps Workshop](images/26.02.2024_23.14.59_REC.png)

Clone the flow.

![LLMOps Workshop](images/26.02.2024_23.18.12_REC.png)

A flow will be created with the following structure:

![LLMOps Workshop](images/26.02.2024_23.21.02_REC.png)

Update the Connection field to point to a gpt-4 deployment in `groundedness_score` node also update max_tokens to `1000` as shown in the next figure.  
   
![LLMOps Workshop](images/26.02.2024_23.24.46_REC.png)

After updating the connection information, **Save** the evaluation flow and navigate to the Flows section in Prompt Flow.

In the Flows section of Prompt Flow, open the **Multi-Round Q&A on Your Data** flow that you created in the previous lab. This will be the flow we use for evaluation.

![LLMOps Workshop](images/26.02.2024_23.43.08_REC.png)

Add a new output to the flow with the documents obtained from retrieval.

This flow output should correspond to the output of the node that generates the final prompt context.

![LLMOps Workshop](images/07.02.2024_23.37.47_REC.png)

Select the **Custom evaluation** option in the Evaluate menu.

![LLMOps Workshop](images/05.01.2024_01.31.10_REC.png)

In the `Prompt_variants` option, select the option to run all prompt variations.

![LLMOps Workshop](images/05.01.2024_01.35.13_REC.png)

Select **Add new data**.

![LLMOps Workshop](images/26.02.2024_23.51.33_REC.png)

Upload the file data.csv inside the lesson_03 folder.

![LLMOps Workshop](images/26.02.2024_23.54.35_REC.png)

After clicking on **Add**  proceed to map the input fields as shown below: 

![LLMOps Workshop](images/05.01.2024_01.36.19_REC.png)

Select the evaluation flow you just created.

![LLMOps Workshop](images/27.02.2024_00.03.19_REC.png)

Select **Next** to configure the `question`, `context` and `answer` fields to be used during the evaluation as in the screen below.

![LLMOps Workshop](images/27.02.2024_01.10.15_REC.png)

Click on Submit.

![LLMOps Workshop](images/05.01.2024_01.44.01_REC.png)

The evaluation process has started. To view all evaluations (one per variant), please navigate to the **Evaluation** section under the **Build** tab.

![LLMOps Workshop](images/27.02.2024_00.28.09_REC.png)

Upon selecting specific evaluation results, you will have the ability to view their detailed information or compare results between different variants.

#### 2) Deploy the RAG flow to an online managed endpoint

Open the **Multi-Round Q&A on Your Data** flow that you created in the previous lab.

After opening the flow, follow the instructions indicated in this link:

https://learn.microsoft.com/en-us/azure/ai-studio/how-to/flow-deploy