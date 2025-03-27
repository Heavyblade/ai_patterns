## Description

This repo contains examples of the patterns described in the senction of II [Patterns of Application Development Using AI](https://leanpub.com/patterns-of-application-development-using-ai) book.

## Pattern implementation examples:

## 1. Prompt Engineering

- [Chain of Thought](prompt_engineering/chain_of_thought.rb)
- [Mode Switch](prompt_engineering/mode_switch.rb)
- [Prompt Chaining](prompt_engineering/prompt_chaining.rb)
- [Prompt Object](prompt_engineering/prompt_object.rb)
- [Prompt Rewriter](prompt_engineering/prompt_rewriter.rb)
- [Prompt Template](prompt_engineering/prompt_template.rb)
- [Query Analyzer](prompt_engineering/query_analizer.rb)
- [Query Rewriter](prompt_engineering/query_rewriter.rb)
- [Response Fencing](prompt_engineering/response_fencing.rb)
- [Role Assignment](prompt_engineering/role_assignment.rb)
- [Structured IO](prompt_engineering/structured_io.rb)
- [Ventriloquist](prompt_engineering/ventriloquist.rb)

## 2. Discrete Components
- [Predicate](discrete_components/predicate.rb)
- [API Facade](discrete_components/api_facade.rb)
- [Response Interpreter](discrete_components/response_interpreter.rb)
- [Virtual Machine](discrete_components/virtual_machine.rb)


## 3. Human in the Loop

HITL patterns are broader and more descriptive than code-related patterns. Here is a summary:

### Escalation

As its name implies, this pattern is used when you want to escalate a task or conversation to a human in the loop.

To implement this, you will need to:

* Define escalation criteria => The set of rules that will trigger the escalation.
* Implement escalation triggers => Monitoring and trigger functions, notifications, etc.
* Notification and task assignment.
* Human review and decision.
* Feedback and model improvements => Use the feedback to improve the model.

### Feedback Loop

The feedback loop pattern is best described as a conversation between the LLM and the user. It could take the form of a chat, a survey, or a conversation between a writer and an editor. In all its forms, the feedback loop is a way to improve the model output by providing new feedback and adjustments.

Areas where this pattern can be used:

* Content creation
* Summarization
* Question-answering conversations, like chatbots or teaching assistants.

### Passive Information Radiation

This pattern describes an AI system where the AI provides information-feedback to the user without the user having to ask for it. This pattern is useful when the AI has information that the user may not know they need.

Examples:

* Desktop assistant that provides reminders and notifications.
* Monitoring system that alerts the user to potential issues.
* AI that monitors financial transactions, assessing risk and sending alerts.

### Continuous Learning

This pattern uses user feedback to improve the model, similar to the "ok" button you see in some chat applications when they give you a response.

In this pattern, the feedback is structured and stored for later use, which could be:

* Improving the model during training.
* Improving prompts and adjusting inference parameters.
* Storing in a RAG system for future reference.

Where this pattern can be used:

* Recommendation systems.
* Chatbots and virtual assistants.
* Predictive maintenance systems.

Note: One possibility is to store the feedback in a RAG system and use it to improve prompts.

## 4. Intelligent Error Handling

This chapter is also somewhat theoretical, in the same way that HITL discussion is more architectural than pattern-based.

### Contextual Error Diagnosis + Intelligent Error Reporting

Here, the author describes how a system could use AI to gather the most relevant information when an error occurs. By saving all this contextual data and utilizing a Retrieval-Augmented Generation (RAG) system to access historical data, logs, or documentation, the AI could analyze the information to identify root causes or potential fixes. This approach could provide developers with a strong starting point during debugging.

**Idea** => With this, we could, for example, capture context about files, variable values, stack traces, and more, store that in a background job, enhance it with logs, and use AI to generate an analysis. This analysis could then create a Jira bug ticket with a substantial amount of information and a hypothesis to begin with.

### Predictive Error Prevention

This involves using AI in code-system analysis to try to prevent errors and also monitoring for anomalies or deviations from the standards.

## 5. Quality Control

### Eval

Eval is essentially the same approach that RAGAS uses to monitor and evaluate the quality of the information provided by the RAG system. However, it is applied to the results of our system by checking reference-free attributes such as coherence, relevance, fluency, factual consistency, and safety.

### Guardrail

The Guardrail pattern is similar to Eval. The logic is basically the same but uses evaluation to make decisions about how appropriate or relevant a response is. Here, it is possible to use a different model that is faster and less prone to being creative.

# Considerations

* Maybe a generalization to parse responses is needed.
