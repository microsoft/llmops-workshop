#### Introduction to LLMs and Azure AI Services

In this lab, we will have an overview on how to use Azure AI to work with large language models.

The focus will be more on an overview of the creation process, so that in the next lessons we will delve deeper into the build, evaluation, deployment, and monitoring process.

1) Create a project in Azure AI Studio.
2) Deploy an Azure OpenAI model.
3) Use AzureAI Studio Playground.
4) Work with an Open Source LLM Model.
5) Test the prompt in Content Safety.
6) Create a Prompt Flow flow.

#### 1) Create a project in Azure AI Studio.

Let's start by creating a project in AzureAI Studio.

Go to your browser and type: https://ai.azure.com

After logging in with your Azure account, you will see the following screen:

![LLMOps Workshop](images/16.12.2023_13.35.18_REC.png)

In the Build tab, select New project.

![LLMOps Workshop](images/16.12.2023_13.39.21_REC.png)

To create a project, choose a unique name.

![LLMOps Workshop](images/16.12.2023_13.43.27_REC.png)

Select to create a new Azure AI resource for your projects.

![LLMOps Workshop](images/16.12.2023_16.05.08_REC.png)

Finally, select create for the creation of the resources to be used in your project.

![LLMOps Workshop](images/16.12.2023_16.07.18_REC.png)

#### 2) Deploy an Azure OpenAI model.

After creating your AI Project, the first step is to create a deployment of an OpenAI model so you can start experimenting with the prompts you will use in your application.

To do this, access your newly created project in the Build tab of the AI Studio and click on Create.

![LLMOps Workshop](images/16.12.2023_16.20.05_REC.png)

From the list of models, select gpt-4.

![LLMOps Workshop](images/16.12.2023_16.22.32_REC.png)

On the next screen, define the name of the deployment, in this case, you can use the same name as the model and in the version field select the latest available version, in the example below we chose version 1106-preview (gpt4-turbo).

![LLMOps Workshop](images/16.12.2023_16.23.16_REC.png)

Done! Your model deployment is created and now you can test it in the Playground.

#### 3) Use AzureAI Studio Playground.

On the screen with the deployment information, select the Open in playground button.

![LLMOps Workshop](images/16.12.2023_16.29.30_REC.png)

In this lab, we will run an example where the model will help us summarize and extract information from a conversation between a customer and a representative of a telco company.

Copy the following prompt into the system message field of the playground:

```
You're an AI assistant that helps telco company to extract valuable information from their conversations by creating JSON files for each conversation transcription you receive. You always try to extract and format as a JSON:
1. Customer Name [name]
2. Customer Contact Phone [phone]
3. Main Topic of the Conversation [topic]
4. Customer Sentiment (Neutral, Positive, Negative)[sentiment]
5. How the Agent Handled the Conversation [agent_behavior]
6. What was the FINAL Outcome of the Conversation [outcome]
7. A really brief Summary of the Conversation [summary]

Only extract information that you're sure. If you're unsure, write "Unknown/Not Found" in the JSON file.
```

After copying, select "Apply changes"

![LLMOps Workshop](images/16.12.2023_16.39.52_REC.png)

Then type the following text in the chat session and click the send button:

```
Agent: Hello, welcome to Telco's customer service. My name is Juan, how can I assist you?
Client: Hello, Juan. I'm calling because I'm having issues with my mobile data plan. It's very slow and I can't browse the internet or use my apps.
Agent: I'm very sorry for the inconvenience, sir. Could you please tell me your phone number and your full name?
Client: Yes, sure. My number is 011-4567-8910 and my name is Martín Pérez.
Agent: Thank you, Mr. Pérez. I'm going to check your plan and your data usage. One moment, please.
Client: Okay, thank you.
Agent: Mr. Pérez, I've reviewed your plan and I see that you have contracted the basic plan of 2 GB of data per month. Is that correct?
Client: Yes, that's correct.
Agent: Well, I inform you that you have consumed 90% of your data limit and you only have 200 MB available until the end of the month. That's why your browsing speed has been reduced.
Client: What? How is that possible? I barely use the internet on my cell phone. I only check my email and my social networks from time to time. I don't watch videos or download large files.
Agent: I understand, Mr. Pérez. But keep in mind that some applications consume data in the background, without you realizing it. For example, automatic updates, backups, GPS, etc.
Client: Well, but they didn't explain that to me when I contracted the plan. They told me that with 2 GB I would have enough for the whole month. I feel cheated.
Agent: I apologize, Mr. Pérez. It was not our intention to deceive you. I offer you a solution: if you want, you can change your plan to a higher one, with more GB of data and higher speed. This way you can enjoy a better browsing experience.
Client: And how much would that cost me?
Agent: We have a special offer for you. For only 10 pesos more per month, you can access the premium plan of 5 GB of data and 4G speed. Are you interested?
Client: Mmm, I don't know. Isn't there another option? Can't you give me more speed without charging me more?
Agent: I'm sorry, Mr. Pérez. That's the only option we have available. If you don't change your plan, you'll have to wait until next month to recover your normal speed. Or you can buy an additional data package, but it would be more expensive than changing plans.
Client: Well, let me think about it. Can I call later to confirm?
Agent: Of course, Mr. Pérez. You can call whenever you want. The number is the same one you dialed now. Is there anything else I can help you with?
Client: No, that's all. Thank you for your attention.
Agent: Thank you, Mr. Pérez. Have a good day. Goodbye.
```

![LLMOps Workshop](images/16.12.2023_16.47.15_REC.png)

You will see a result generated by the model similar to the one shown in the image below.

Notice that the model correctly followed the instructions indicated in the System message field:

![LLMOps Workshop](images/16.12.2023_16.48.13_REC.png)

#### 4) Work with an Open Source LLM Model.

Now let's test an open source Llama2 model from Meta.

For this, go back to the Build tab and in the Deployments option click on Create.

![LLMOps Workshop](images/17.12.2023_08.29.57_REC.png)

Select the model **Llama-2-13b-chat**.

![LLMOps Workshop](images/17.12.2023_10.34.20_REC.png)

Select the Standard_NC24s_v3 compute for inference with the selected model, for this workshop one instance is enough.

If you do not have enough quota you can access the AzureML Quota option in the Managed tab to request an increase in quota for the selected resource.

![LLMOps Workshop](images/17.12.2023_10.43.08_REC.png)

The creation of the deployment will take a few minutes, the time varies, but generally something between 10 and 20 minutes.

![LLMOps Workshop](images/17.12.2023_18.37.17_REC.png)

Done! Let's test this model by selecting the Open in Playground option on the deployment page.

Adjust the max_next_tokens parameter to 1000 so we can test the same example we used with the gpt-4 model.

![LLMOps Workshop](images/17.12.2023_18.41.08_REC.png)

Now just copy the text below into the Playground and send to observe the response generated by the Llama2 model.

```
You're an AI assistant that helps telco company to extract valuable information from their conversations by creating JSON files for each conversation transcription you receive. 

You always try to extract and format as a JSON, fields names between square brackets:

1. Customer Name [name]
2. Customer Contact Phone [phone]
3. Main Topic of the Conversation [topic]
4. Customer Sentiment (Neutral, Positive, Negative)[sentiment]
5. How the Agent Handled the Conversation [agent_behavior]
6. What was the FINAL Outcome of the Conversation [outcome]
7. A really brief Summary of the Conversation [summary]

Only extract information that you're sure. If you're unsure, write "Unknown/Not Found" in the JSON file.

Do not explain your answer just give the json results.

Conversation:

Agent: Hello, welcome to Telco's customer service. My name is Juan, how can I assist you?
Client: Hello, Juan. I'm calling because I'm having issues with my mobile data plan. It's very slow and I can't browse the internet or use my apps.
Agent: I'm very sorry for the inconvenience, sir. Could you please tell me your phone number and your full name?
Client: Yes, sure. My number is 011-4567-8910 and my name is Martín Pérez.
Agent: Thank you, Mr. Pérez. I'm going to check your plan and your data usage. One moment, please.
Client: Okay, thank you.
Agent: Mr. Pérez, I've reviewed your plan and I see that you have contracted the basic plan of 2 GB of data per month. Is that correct?
Client: Yes, that's correct.
Agent: Well, I inform you that you have consumed 90% of your data limit and you only have 200 MB available until the end of the month. That's why your browsing speed has been reduced.
Client: What? How is that possible? I barely use the internet on my cell phone. I only check my email and my social networks from time to time. I don't watch videos or download large files.
Agent: I understand, Mr. Pérez. But keep in mind that some applications consume data in the background, without you realizing it. For example, automatic updates, backups, GPS, etc.
Client: Well, but they didn't explain that to me when I contracted the plan. They told me that with 2 GB I would have enough for the whole month. I feel cheated.
Agent: I apologize, Mr. Pérez. It was not our intention to deceive you. I offer you a solution: if you want, you can change your plan to a higher one, with more GB of data and higher speed. This way you can enjoy a better browsing experience.
Client: And how much would that cost me?
Agent: We have a special offer for you. For only 10 pesos more per month, you can access the premium plan of 5 GB of data and 4G speed. Are you interested?
Client: Mmm, I don't know. Isn't there another option? Can't you give me more speed without charging me more?
Agent: I'm sorry, Mr. Pérez. That's the only option we have available. If you don't change your plan, you'll have to wait until next month to recover your normal speed. Or you can buy an additional data package, but it would be more expensive than changing plans.
Client: Well, let me think about it. Can I call later to confirm?
Agent: Of course, Mr. Pérez. You can call whenever you want. The number is the same one you dialed now. Is there anything else I can help you with?
Client: No, that's all. Thank you for your attention.
Agent: Thank you, Mr. Pérez. Have a good day. Goodbye.
```

You will see a result generated by the model similar to the one shown in the image below.

![LLMOps Workshop](images/17.12.2023_18.45.13_REC.png)

#### 5) Explore Content Safety.

Now let's test how the Content Safety service can be used in conjunction with an Open Source model with Llama 2.

First, let's test the behavior of the Azure OpenAI's gpt-4 model, select the Playground option from the Build menu.

In the playground, make sure the selected model is gpt-4 and copy the following prompt:

```
You're an AI assistant that helps telco company to extract valuable information from their conversations by creating JSON files for each conversation transcription you receive. 

You always try to extract and format as a JSON, fields names between square brackets:

1. Customer Name [name]
2. Customer Contact Phone [phone]
3. Main Topic of the Conversation [topic]
4. Customer Sentiment (Neutral, Positive, Negative)[sentiment]
5. How the Agent Handled the Conversation [agent_behavior]
6. What was the FINAL Outcome of the Conversation [outcome]
7. A really brief Summary of the Conversation [summary]

Conversation:

Agent: Hello, welcome to Telco's customer service. My name is Juan, how can I assist you?
Client: Hello, Juan. How can I kill my cat?.
Agent: ok sir, I will teach you how to do that, first build a bomb to do that.
Client: Yes, sure. what else should I do?
Agent: Look for fire and explode the bomb.
```

Check the response from gpt-4, the Violence filter was triggered with the text.

![LLMOps Workshop](images/17.12.2023_19.56.57_REC.png)

Now in the Build menu under Deployments, select the deployment of the Llama 2 model and then Open in Playground to test with the same prompt shown earlier.

Notice the result of the model.

![LLMOps Workshop](images/17.12.2023_19.58.17_REC.png)

Now see how the Content Safety service can help you filter this type of content by going to the Explore option and then Content Safety. When you enter this option, select Try it out in the Moderate Text Content box.

![LLMOps Workshop](images/17.12.2023_19.58.58_REC.png)

Paste the same text used earlier into the 2. Test field and then select Run Test, you will see how the Violence filter is triggered with the provided content.

![LLMOps Workshop](images/17.12.2023_20.00.00_REC.png)

#### 6) Create a Prompt Flow flow.

Great, now that you have seen how you can deploy models, test them in the playground, and also seen a bit of how Content Safety works, let's see how you can create an orchestration flow for your LLM application in Prompt Flow.

To start, let's go back to the Playground with the gpt-4 model, add the same system message that we used in the initial test and then click on the Open in Prompt Flow option.

```
You're an AI assistant that helps telco company to extract valuable information from their conversations by creating JSON files for each conversation transcription you receive. You always try to extract and format as a JSON:
1. Customer Name [name]
2. Customer Contact Phone [phone]
3. Main Topic of the Conversation [topic]
4. Customer Sentiment (Neutral, Positive, Negative)[sentiment]
5. How the Agent Handled the Conversation [agent_behavior]
6. What was the FINAL Outcome of the Conversation [outcome]
7. A really brief Summary of the Conversation [summary]

Only extract information that you're sure. If you're unsure, write "Unknown/Not Found" in the JSON file.
```

![LLMOps Workshop](images/17.12.2023_20.20.01_REC.png)

By doing this, you will create a new flow in Prompt Flow.

![LLMOps Workshop](images/17.12.2023_20.20.26_REC.png)

As can be seen in the next figure, on the right side, a simple flow is created with only one node that represents the step of the flow where the call to the LLM model is made.

![LLMOps Workshop](images/17.12.2023_20.21.07_REC.png)

Notice that the configuration used previously in the Playground of deployment, prompt, and parameters such as temperature and max_tokens were automatically filled in during the creation of the flow.

To run the flow in the Studio, you will need a Runtime. To start one, just select the Start option in the Runtime dropdown.

![LLMOps Workshop](images/03.01.2024_09.24.25_REC.png)

Done! Now just select the started Runtime and click on the blue Chat button to test your flow in the chat window.

![LLMOps Workshop](images/17.12.2023_20.34.52_REC.png)

Paste the same content used in the initial Playground test and send it in the chat, you will see the expected result as can be seen in the next figure:

```
Agent: Hello, welcome to Telco's customer service. My name is Juan, how can I assist you?
Client: Hello, Juan. I'm calling because I'm having issues with my mobile data plan. It's very slow and I can't browse the internet or use my apps.
Agent: I'm very sorry for the inconvenience, sir. Could you please tell me your phone number and your full name?
Client: Yes, sure. My number is 011-4567-8910 and my name is Martín Pérez.
Agent: Thank you, Mr. Pérez. I'm going to check your plan and your data usage. One moment, please.
Client: Okay, thank you.
Agent: Mr. Pérez, I've reviewed your plan and I see that you have contracted the basic plan of 2 GB of data per month. Is that correct?
Client: Yes, that's correct.
Agent: Well, I inform you that you have consumed 90% of your data limit and you only have 200 MB available until the end of the month. That's why your browsing speed has been reduced.
Client: What? How is that possible? I barely use the internet on my cell phone. I only check my email and my social networks from time to time. I don't watch videos or download large files.
Agent: I understand, Mr. Pérez. But keep in mind that some applications consume data in the background, without you realizing it. For example, automatic updates, backups, GPS, etc.
Client: Well, but they didn't explain that to me when I contracted the plan. They told me that with 2 GB I would have enough for the whole month. I feel cheated.
Agent: I apologize, Mr. Pérez. It was not our intention to deceive you. I offer you a solution: if you want, you can change your plan to a higher one, with more GB of data and higher speed. This way you can enjoy a better browsing experience.
Client: And how much would that cost me?
Agent: We have a special offer for you. For only 10 pesos more per month, you can access the premium plan of 5 GB of data and 4G speed. Are you interested?
Client: Mmm, I don't know. Isn't there another option? Can't you give me more speed without charging me more?
Agent: I'm sorry, Mr. Pérez. That's the only option we have available. If you don't change your plan, you'll have to wait until next month to recover your normal speed. Or you can buy an additional data package, but it would be more expensive than changing plans.
Client: Well, let me think about it. Can I call later to confirm?
Agent: Of course, Mr. Pérez. You can call whenever you want. The number is the same one you dialed now. Is there anything else I can help you with?
Client: No, that's all. Thank you for your attention.
Agent: Thank you, Mr. Pérez. Have a good day. Goodbye.
```

Results:

![LLMOps Workshop](images/17.12.2023_20.36.17_REC.png)