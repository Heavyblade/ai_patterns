require_relative '../ai_patterns'

# Mode Switch
#
# Mode switch is like applying plugins to prompt ingeneering, basically you have 
# your 'agent' with a basic set of instructions-functions and a particular context,
# but you can also switch modes to enhace the default behavior or even make it
# simpler-faster.

date = '2022-10-10'
apointments = [
  { date: '2022-10-10', available: false },
  { date: '2022-10-11', available: false },
  { date: '2022-10-12', available: true }
]

messages = [
  { role: 'system', content: 'You are logistic coordinator' },
  { role: 'user', content: <<~PROMPT }
    With my list of appointments:
    #{apointments.map { |appointment| "-#{appointment[:date]}\n" }}

    Assign if possible the date #{date} if is available
  PROMPT
]

messages << { user: 'and notify me via xxxx function if date is available' } if ENV['NOTIFY']

Agents::Chater.new(:schedule_manager).chat(messages: messages)
