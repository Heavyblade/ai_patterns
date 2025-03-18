require_relative '../ai_patterns'

# Escalation
#
#
# As it's name implies, this pattern is used when you want to escalate task
# or converstion to a human in the loop.
#
# To implement you will need to:
#
# * Define scalation criteria => The set of rules that will trigger the escalation.
# * Implement scalation triggers => Monitoring and trigger functions, notifications, etc
# * Notification and task assignment.
# * Human Review and decision.
# * Feeback and Model improvements => use the feedback to improve the model.


# There is no simple and practical example to show here because a complex scenario
# this is how it could work on a real world scenario:
#
# +-----------------------------+
# | Remote Patient Monitoring   |
# | System                      |
# +-------------+---------------+
#               |
#               v
# +-------------+---------------+
# | AI Analyzes Patient Data    |
# +-------------+---------------+
#               |
#               v
# +-------------+---------------+
# | Anomaly Detected            |
# +-------------+---------------+
#               |
#               v
# +-------------+---------------+
# | Case Escalated to Human     |
# | Clinician                   |
# +-------------+---------------+
#               |
#               v
# +-------------+---------------+
# | Human Clinician Reviews     |
# | Data and Intervenes         |
# +-------------+---------------+
#               |
#               v
# +-------------+---------------+
# | Real-time Intervention      |
# +-----------------------------+
