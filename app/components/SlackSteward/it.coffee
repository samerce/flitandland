import React from 'react'

import useBus from '../../hooks/useBus.coffee'

SlackWebhookUrl = process.env.SLACK_WEBHOOK_URL

export default =>
  useBus
    PostToSlack: ({msg, channel}) =>
      cast 'PostToSlackPending'
      fetch(SlackWebhookUrl, {
        method: 'POST'
        headers:
          Accept: 'application/json'
        body: JSON.stringify({
          text: msg
          channel: '#' + channel
        })
      }).then (response) =>
        if response.ok then cast 'PostToSlackDone'
        else cast 'PostToSlackFailed', response.status
  <div />
