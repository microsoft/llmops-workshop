**llmops_config.json** file configuration parameters:

- `ENV_NAME`:  This represents the environment type. (The template example supports *pr*, *dev* and *postprodeval* environments.)
- `RUNTIME_NAME`:  This is the name of a Prompt Flow runtime environment, used for executing the prompt flows. Add values to this field only when you are using dedicated runtime and compute. The template uses automatic runtime by default.
- `KEYVAULT_NAME`:  This points to an Azure Key Vault related to the Azure ML service, a service for securely storing and managing secrets, keys, and certificates.
- `RESOURCE_GROUP_NAME`:  Name of the Azure resource group related to Azure ML workspace.
- `WORKSPACE_NAME`:  This is name of Azure ML workspace.
- `STANDARD_FLOW_PATH`:  This is the relative folder path to files related to a standard flow. e.g.  e.g. "flows/standard_flow.yml"
- `EVALUATION_FLOW_PATH`:  This is a string value referring to relative evaluation flow paths. It can have multiple comma separated values- one for each evaluation flow. e.g. "flows/eval_flow_1.yml,flows/eval_flow_2.yml"