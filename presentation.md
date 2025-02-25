---
title: AI Development Patterns
author: CristianV
theme:
  name: terminal-dark
---

AI Development Patterns
===

```ruby
# prompt_engineering/role_assignment.rb

prompt = <<~PROMPT
Mary has 12 cookies and eats 4, how many cookies does she has left?

What is the starting number of cookies Mary has?
How Many cookies does Mary eat?
How can we find the remaining cookies?
PROMPT

messages = [
  { role: 'user', content: prompt }
]

puts Agents::Chat.new(:role_player).chat(messages: messages)
```
