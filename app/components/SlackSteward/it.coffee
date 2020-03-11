import React from 'react'

import useBus from '../../hooks/useBus.coffee'

SlackWebhookUrl = process.env.SLACK_WEBHOOK_URL
console.log 'slack:\n', process.env.SLACK_WEBHOOK_URL
console.log 'insta:\n', process.env.INSTAGRAM_TOKEN
console.log 'env:\n', process.env.NODE_ENV
console.log 'square:\n', process.env.SQUARE_ACCESS_TOKEN


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
