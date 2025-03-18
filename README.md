## Description

This repo contains examples of the patterns described in the [Patterns of Application Development Using AI](https://leanpub.com/patterns-of-application-development-using-ai)

In the same way here is an small summary of the book aspects:

## Example patterns

### Prompt Engineering

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

### Discrete Components
- [Predicate](discrete_components/predicate.rb)
- [API Facade](discrete_components/api_facade.rb)
- [Response Interpreter](discrete_components/response_interpreter.rb)
- [Virtual Machine](discrete_components/virtual_machine.rb)


### Human in the Loop

HITL are wider patterns and more descriptive than code related, here is a summary:

#### Escalation

As it's name implies, this pattern is used when you want to escalate task
or converstion to a human in the loop.

To implement you will need to:

* Define scalation criteria => The set of rules that will trigger the escalation.
* Implement scalation triggers => Monitoring and trigger functions, notifications, etc
* Notification and task assignment.
* Human Review and decision.
* Feeback and Model improvements => use the feedback to improve the model.

#### Feedback Loop

The feedback loop pattern is best described as a conversation between the LLM and the user.
It could take the form of chat, a survey, or a conversation between a writer and an editor.
In all its forms, the feedback loop is a way to improve the model output by providing new
feedback and adjustments.

Areas where this pattern can be used:

* Content creation
* Summarization
* Question answering conversations, like chatbots or teaching assistants.

#### Passive Information Radiation

This pattern describes an AI system where the AI provides information-feedback to the user
without the user having to ask for it. This pattern is useful when the AI has information
that the user may not know they need.

Examples:

* Desktop assistant that provides reminders and notifications.
* Monitoring system that alerts the user to potential issues.
* AI that monitors financial transactions assesing risk and sending alerts.

#### Continuos Learning

Basically uses user feedback to improve the model, this is :ok button that you see
in some chat applications when they give you a response.

In this patern the feedback is structured and stored for later usage, that could be:

* Improve the model on the training.
* Improve prompts and adjusting inference parameters.
* Store in RAG system for future reference.

Where this pattern can be used:

* Recommendation systems.
* Chatbots and virtual assistants.
* Predictive maintenance systems.

Note: One posibility is to store the feedback in a RAG system and use it to improve promtps.

## Considerations

* Maybe a generalization to parse responses is needed

