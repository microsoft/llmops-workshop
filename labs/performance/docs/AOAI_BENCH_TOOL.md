---
title: 'Benchmarking Azure OpenAI Models'
layout: default
nav_order: 1
parent: 'Lab 07: Performance Evaluation'
---
#### Benchmarking Azure OpenAI Models

The [Azure OpenAI Benchmarking Tool](https://github.com/Azure/azure-openai-benchmark) is a powerful resource for evaluating the performance of Azure OpenAI deployments. It proves especially beneficial during the early stages of a project, aiding developers in assessing whether the model deployment is correctly sized and facilitating comparisons between different Azure OpenAI deployments. 

The tool delivers comprehensive latency metrics and simulates various traffic patterns. If you're interested in learning more about the benchmarking tool and LLM Performance testing, please visit the [LLM Apps Performance Evaluation](PERFTEST_CONCEPTS.md) page.

In this Lab, you will learn how to set up and run a load test on an Azure OpenAI model deployment using the Azure OpenAI Benchmarking Tool. You will also learn how to interpret the results of the test and adjust parameters for different testing scenarios.

##### Test Scope

For simplicity and educational purposes, this lab will focus on the PayGo endpoint using a Standard deployment of the gpt-35-turbo-16k model. However, the same procedures learned here can also be applied to gpt-4 models and Provisioned Throughput Units (PTU) deployments.

##### Test Architecture

In our testing setup, we primarily use the gpt-35-turbo-16k model in a standard deployment with a quota of 20K TPM (Tokens Per Minute).

In the example provided in this guide, you will deploy the resource in the East US (eastus) Azure region. However, remember that you're free to choose any region that works best for you.

For accurate testing, run the Azure OpenAI Benchmarking Tool in the same region as your final application deployment. This mirrors the typical scenario where the client and the Azure OpenAI model deployment are in the same region.

Running the test from the same region as your deployment not only provides a more realistic scenario, but it also eliminates any variations in latency that might occur if you were to run the test from your home network.

For the sake of simplicity in this lab, you'll operate the tool from your own workstation.

##### Test Scenario

This test scenario involves running a load test on an Azure OpenAI model deployment using the AOAI Benchmarking tool. Initially, the test mimics a situation where 4 requests are sent every minute, following a custom shape profile. Subsequently, we increase the number of requests per minute to 50.

Each request will contain 4500 context tokens and will generate a maximum of 500 tokens. No retries will be made for failed requests. The test runs for a total of 180 seconds (3 minutes).

While this guide presents a simple scenario, you're encouraged to experiment with the parameters to simulate and test different scenarios after the initial run.

##### Prerequisites

Before you begin, ensure you have the necessary tools and services installed as listed in this section.

- VS Code to run the analysis notebook: [Download VS Code](https://code.visualstudio.com/Download)

- Python 3.11 to run the benchmarking tool: [Download Python](https://www.python.org/downloads/release/python-3118/)

- Git: [Download Git](https://git-scm.com/downloads)

##### Lab Setup

After finishing the prerequisites, you can start setting up the lab.

###### Python environment setup

1. **Clone the Workshop Repository:** If you haven't already, clone the LLMOps workshop repository to your local machine using the following command:

```bash
git clone git@github.com:microsoft/llmops-workshop.git
```

2. **Navigate to the lab directory:** Open your terminal and navigate to the `llmops-workshop/labs/performance` directory. This is where you cloned the repository in the previous step.

Next, let's set up your Python environment. This includes the libraries you'll use for executing tests and analyzing results. If you're using a Python environment manager like [Conda](https://docs.anaconda.com/free/miniconda/), create a new environment with Python 3.11, as demonstrated in steps 3 and 4. If you're not using Conda, that's okay. Just make sure you have Python 3.11 installed on your machine and proceed to step 5.

3. Create the Python environment with Conda.

```bash
conda create -n aoai_benchmarking python=3.11
```

4. **Activate the Environment:**

```bash
conda activate aoai_benchmarking
```

5. **Install the Required libraries:** Install the libraries that will be used in this lab.

```bash
pip install -r requirements.txt
```

6. **Clone the Benchmarking Tool repository:**

```bash
git clone git@github.com:Azure/azure-openai-benchmark.git
```

7. **Install the Libraries used by the Benchmarking Tool:**

```bash
pip install -r azure-openai-benchmark/requirements.txt
```

Great job! Your Python environment is now ready for this lab.

###### Azure Resources Setup

1. **Deploy the gpt-35-turbo Model:** For this lab, you'll need a gpt-35-turbo model deployment. If you haven't already done so, follow the instructions in [Resource and Model Deployment](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/create-resource) to create one. Initially, deploy the model with a quota of 20K TPMs.

2. **Configure Diagnostic Settings (Optional):** Configure Diagnostic Settings to send log data from your Azure OpenAI resource to Azure Monitor. This helps analyze server metrics post-test. Follow the steps in [this link](https://learn.microsoft.com/en-us/azure/ai-services/openai/how-to/monitoring#configure-diagnostic-settings) to set it up.

Great job! Your Azure resources are now ready for this lab.

##### Running the Test

To run the test, follow these steps:

1. **Navigate to the lab directory:** Open your terminal and navigate to the `llmops-workshop/labs/performance` directory. This is where you cloned the repository in the previous step.

At this point, you can continue executing in the terminal or open this directory in VS Code for a more convenient experience:

```bash
code .
```

2. For the test execution, rename the file [`benchmark.parameters.template`](benchmark.parameters.template) to `benchmark.parameters`.

This file contains the necessary parameters for the benchmarking tool to connect to the deployment endpoint, as well as information related to the scenario that will be reproduced.

3. Update the `benchmark.parameters` file:

Open the `benchmark.parameters` file and update the first four parameters of the file:

```
OPENAI_API_KEY=[replace with your Azure OpenAI API key]
AOAI_ENDPOINT=https://[replace with your Azure OpenAI resource name].openai.azure.com/
AOAI_DEPLOYMENT=[replace with your Azure OpenAI deployment name]
TEST_NAME=[replace with your Test Run name]
```

In `TEST_NAME` use **paygo-gpt35-eastus-4RPM**, for example:

`TEST_NAME=paygo-gpt35-eastus-4RPM`

For the other three parameters, replace the placeholders with the corresponding values for your case.

4. Run the test

In the terminal, execute the following command according to the type of shell used:

**bash**

```
./runtest.sh
```

5. Update the deployment quota to 200K TPM and repeat steps 3 and 4, but use paygo-gpt35-eastus-50RPM in the `TEST_NAME` field in step 3.

##### Analyzing the Results

To analyze the results of your test, follow these two steps:

1. **Analyze Azure OpenAI Metrics:** Navigate to your Azure OpenAI resource in the Azure portal. In the Monitoring section, select the Metrics option. Here, you can analyze metrics such as Azure OpenAI Requests and Blocked errors.

2. **Run the Analysis Notebook:** Execute the [`benchmark_analysis.ipynb`](../benchmark_analysis.ipynb) file to analyze the test results further. Follow the instructions in the notebook to complete this step.