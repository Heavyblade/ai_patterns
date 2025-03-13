## AI Engineering (requirements)
- Understanding of available models and their strong/weak points
- Understanding of patters to implement solutions based on that models.

### Compount AI Systems


### Deployment options

AI applications can take severals forms depending on the way that AI is being used:

* Question and answer => GPT + RAG
* Multi-Agent/Agentic problem solvers => Specialization + Collaboration + Adaptability, here several specialized agents
* Conversational AI => Like Chat GPT is a chatbot that has the mission to help a person to get an X result.
* Copilots => Work side-by-side providing help and probably anticipating human needs and learning in the process.

### Roles

* Generator
* Retriever => RAG like systems
* Ranker
* Classifier =>  the goal is to assign a specific category to each input

# Narrow the Path
narrowing the path refers to context disambiguation

Given the large rally large amount of information embedded on LLM models like GPT, the model is susceptible to:

* Information Overload
* Contextual Ambiguity
* Temporal Inconsistencies
* Domain-Specific Nuances"

> A different way to think of it is like using a spotlight in a completely dark
museum. If you’ve ever visited the Louvre or Metropolitan Museum of Art

![[data_nodes_ai.png]]

## How to narrow the path:

* Prompt engineering
* Context Augmentation  --> RAG
* Fine Tunning - Domain adaptation

### Raw Versus Instruct-Tuned Models

* *Raw Model* => Is just the model as it basics, almost with pure training data, it doesn't have the training to follow a conversation or to process instructions like llama 2-70B
* *Instruct-Tunned* => Models like GTP 3-4 are training with complementary datasets like [Data Bricks](https://huggingface.co/datasets/databricks/databricks-dolly-15k) to teach the model how to uses prompts to access its underlying data.

### Prompt Engineering.

Is a combination of instructions, examples and context 

Context => Relevant information to take into account to process the request and relevant information about the expected result.
#### Prompt Elements:

* Instructions
* Context
* Examples
* Input formatting => Delimiters, paragraphs, bullets, space holders.
* Output Formatting
#### Prompting Techniques:
* Zero-shot vs Few-shot
* Iterative Refinement
* Prompt chaining
* Prompt tunning

### The Art o vagueness

However, it’s important to note that being vague doesn’t mean being unclear or ambiguous. The key is to provide enough context and guidance to steer the LLM in the right direction while allowing it the flexibility to utilize its knowledge and generalization capabilities.

### Separating Instructions from Data: A Crucial Principle

For the LLM the entire prompt is just instructions, it treat it as one thing, there is no logical separations between instructions an data, for that using marks like xml tags helps the LLM to make that distinction.

> While the current state of LLMs may not have a formal separation of instruc- tions and data, it’s essential for you, as a developer, to be mindful of this limitation and take proactive measures to mitigate the risks

#### Prompt Destillation

Basically consist on using the AI itself to improve the prompts by

1. first you ask for the initial prompt describing what is need
2. then iterate on the prompt by providing feedback about needed or unnecesary work, plus asking for the needed context.
3. Establishing system directive and context. 
# RAG

For a given prompt, those databases are queried to retrieve relevant information, which is then combined with the prompt to provide richer context to the LLM.
### Steps

1. Query generation => Basic promtp + aditional data o reformulation to better match the RAG db
2. Knowledge Retrieval
3. Reranking => just better organize
4. if prompt is expressed in the form of question, this step tryies to modify-improve the response to become an answer.
5. Response Generation.

### Implementing RAG on your application

1. Define your knowledge sources
2. Develop a retrieval mechanism => The way that you are going to search on all that data the one that is actually relevant for the context
3. Integrate Retrieval context => once you have the data you need a way to send it along with the prompt to the LLM
4. Experiment Retrieval and Generation => as always a try-error process


#### Chunking the data (1) + (2)

To actually do the steps 1 and 2 we need to decide how the knowledge base is going to be chunked so it we can get the embeddings for the vector similarity.


### RAG with out embeddings:

Steps:

1) take al your content ask an LLM for summaries of each section and assign an identification for each summary
2) store that summary on a DB
3) on every request, first use the summary a entire JSON as context for the question but first ask the LLM for the relevant sections to that question and to return the ids of the relevant sections
4) retrieve the entire sections selected by the LLM
5) use that sections and context in the same way that other RAG systems.

### Intelligent Query Optimization

This is a technique that consist on re-write the query in a way that preserve its meaning but is more aligned with the RAG information so the system can retrieve more relevant data to perform the LLM query.


## Reranking

Is another technique to improve the RAG result in cases were coincidences of the retrieved information can be a lot of entries, you need a system that allows you to select the ones that better serves the app purpose.

### RAG Assessment (RAGAs)

A framework to evaluate the effectiveness of your RAG model, with a framework basically it has a set of metrics that allows you to "monitor" the effectiveness of your RAG model.

- Faithfulness
- Answer relevance
- Context Precision
- Context Relevancy
- Context Recall
- Context Entities Recall
- Answer Semantic Similarity
- Answer Correctness
- Aspect Critique

# Multitude of workers

The goal of this approach is to divide the needed work in different steps handle by a mix of different workers a deterministic code, for that we need to things:

1) An integration library like [Raix](https://github.com/OlympiaAI/raix)
2) Programming pattern like [Railway Oriented Programming](https://gitlab.com/gitlab-org/gitlab/-/blob/6faa532ebe84ab12018cd661fad14d9c68359ac3/ee/lib/remote_development/README.md#railway-oriented-programming-and-the-result-class) that accounts for failures and different paths.

### Integration AI workers into the architecture

to integrate AI workers we should think about them a like a micro-services architecture conceptually, a bunch of small services each one with a single responsibility that cooperate to achiever collective goals
#### Architecture

* API-based Integration => use API base communication by leveraging standard protocols
* Message-based Communication => Use message base communication when is possible for workers to perform it's work syncronously.
* Event-driven architecture => build your system around an architecture based on events.

#### Data handling

* Date preparation => clean, remove noice, types.
* Data persistence => what parts of the interactions are going to be saved.
* Data Retrieval
* Error handling and recovering.

### Dynamic selection and invocation of workers

If we have our tasks properly divided by workers then an upper code or other worker can analyze the question and select which worker is the best one the deal with the query, something like a 'router' worker

# Tool Use

is the same as "function calling", is like RAG but inverted, here instead of first fetching data to improve the context for the LLM query, we are given the model the posibility of calling external tools to get the data or perform the needed actions.


## The tool use workflow typically involves four key steps:

1. Include function definitions in your request context 2.
for that you should use the LLM API description to define the schemas, for example for [Claude 3.5](https://docs.anthropic.com/en/docs/build-with-claude/tool-use) this is the schema:

```json
{
  "name": "Get_wather",
  "description": "Get the weather for a specific location",
  "input_schema": {
    "type": "object",
    "properties": {
      "location": {
        "type": "string",
        "description": "The location for which you want the weather"
      },
      "unit": {
        "type": "string",
        "description": "The unit for the temperature",
        "enum": ["C", "F"]
      }
    }
  }
}
```

Note: The precise syntax of tool definition is model-specific.

1. Dynamic (or explicit) tool selection  
The model after sending the request will return the function to call and the parameters that should be used.

2. Execution of function(s)  
With 1 and 2 you will get the response or part of it and use that estructure to actually execute the code.
3. Optional continuation of the original prompt.

![[Tool_use]]

## Stream processing


A structure capable of receive chunks of text from the LLM API and process it as they come is very important so we reduce wait time and the system can quickly react to function calls made by the LLM.

We could say that tool use is a definition of WHAT is happening but Stream processing is HOW it is going to happen, basically is a mix of an state machine that represent the conversation and two connections/websockets where the Rails code gets more chunks from the LLM API and send data as it come to the user.

## Self Healing Data

AI workers are employed to continuously monitor and analyze your application’s data. These models have the ability to understand and interpret patterns, relationships, and anomalies within the data

Needed steps:

1. Data Monitoring => AI workers are basically proxies that can read the app data.
2. Anomaly Detection => AI search for patters of inconsistency, missing values, errors, etc.
3. Diagnosis and Correction => AI worker uses its LLM capabilties + any extra data to improve the info
4. Continues Learning(optional) => Is possible to use a proper description of the anomaly + the way to fix it to later train or fine-tune the model.


![[self_healing_example.png]]
### Considerations and Counterindications

Self healing data isn't a silver bullet there are hight regulated environments where this approach could be considered ilegal, besides legal reasons performance is another aspect to take into account, senting back an forth large ammounts of data to llms could have a negative impact on the app performance.

Factors to considere:

* **Error Severity** => How big are the consecuences of the AI making errors while correcting the data.
* **Data Complexity** => Rules of formatting and types should be strict and should not be complex business logic that couple data.
* **Explainability and transparency** => If there is a need for auditing techniques like 'chain of tought', 'human in the loop' and logging and monitoring mechanisms should be put in place to deal with this requirement.
* **Unintended Consecuences** => 


## Contextual Content Generation

The key benefits of Contextual Content Generation patterns is the ability to deliver highly personalized experiences to users; basically it means decorating-enhancing the responses or content that is going to delivered to the customer taking into account data that the application already has for the customer, IE => modify a product description based on the customer gender:

---
**user** give a short product description for watch when you know that the current app customer is a man
**chatgtp** Introducing our sleek and sophisticated watch app designed for the modern man on the go. Stay organized, punctual, and stylish with this must-have accessory for your wrist. Download now and elevate your timekeeping game to the next level.

**user** give a short product description for watch when you know that the current app customer is a woman
**chatgtp** the ultimate watch app designed for the contemporary woman who values both style and functionality. Stay on top of your schedule with elegance and grace. Download now to add a touch of sophistication to your everyday look.

---

## Generative UI

Basically is taking the Contextual Content Generation to the UI, allowing to have 

> personalized experiences at scale

### Generating Copy for User Interfaces

* *Personalized forms* => Is way to use AI to help the user and collect data more efficiently.
* Adaptative Field Ordering.
* Personalized Microcopy.
* Personalized Validations.

### Defining Generative UI

Is the posibility to allow LLMs to generate on the fly html elements, js, React Components, Css, etc; based on demographycs, user preferences or past interactions.


> GenUI represents a significant shift in how we approach user interface design, moving away from one-size-fits-all solutions and towards highly personalized, adaptive experiences. By leveraging the power of AI, GenUI has the potential to revolutionize the way we interact with digital products and services, creating interfaces that are more intuitive, engaging, and effective for each individual user.

### The Shift to Outcome‐Oriented Design

1. Focus on User Goals.
2. Changing role of designers => Designers will transition from creating fixed layouts to defining rules, constraints, and guidelines for AI systems to follow when generating interfaces.
3. Importance of User Research => have a deep understanding of the user will be even more important.
4. Designing for Variability.

## Inteligent Workflow Orchestration

Key patterns:

* Dynamic Task Routing
* Contextual desicion making
* Adaptative Work Composition
